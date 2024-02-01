// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Holographic Projection"
{
	Properties
	{
		_MainTex("Main Texture", 2D) = "white" {}
		[Header(Hologram Settings)]_HologramPattern("Hologram Pattern", 2D) = "white" {}
		[HDR]_EmissionColor("EmissionColor", Color) = (1,1,1,0)
		_Power("Power", Range( 0.1 , 5)) = 1
		[Header(Position Falloff settings)]_Pos("Pos", Vector) = (0,0,0,0)
		_MaxDistance("Max Distance", Float) = 1
		_DistanceFalloff("Distance Falloff", Float) = 0
		[Header(Others)]_FauxLightingFactor("Faux Lighting Factor", Range( 0 , 1)) = 0.37
		_VertexOffset("Vertex Offset", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
		LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend One One
		Cull Back
		ColorMask RGBA
		ZWrite Off
		ZTest LEqual
		
		
		
		Pass
		{
			Name "Unlit"
			
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_TEXTURE_PARAMS(textureName) textureName
			


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
			};

			uniform float _VertexOffset;
			uniform float _MaxDistance;
			uniform float3 _Pos;
			uniform float _DistanceFalloff;
			uniform sampler2D _HologramPattern;
			uniform float4 _HologramPattern_ST;
			uniform float4 _EmissionColor;
			uniform float _Power;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float _FauxLightingFactor;
			inline float4 TriplanarSamplingSF( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = ( tex2D( ASE_TEXTURE_PARAMS( topTexMap ), tiling * worldPos.zy * float2( nsign.x, 1.0 ) ) );
				yNorm = ( tex2D( ASE_TEXTURE_PARAMS( topTexMap ), tiling * worldPos.xz * float2( nsign.y, 1.0 ) ) );
				zNorm = ( tex2D( ASE_TEXTURE_PARAMS( topTexMap ), tiling * worldPos.xy * float2( -nsign.z, 1.0 ) ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord = v.vertex;
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				float3 vertexValue = ( v.ase_normal * _VertexOffset );
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				fixed4 finalColor;
				float clampResult41 = clamp( distance( ( i.ase_texcoord.xyz / _MaxDistance ) , _Pos ) , 0.0 , 1.0 );
				float2 uv0_HologramPattern = i.ase_texcoord1.xy * _HologramPattern_ST.xy + _HologramPattern_ST.zw;
				float3 ase_worldPos = i.ase_texcoord2.xyz;
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float4 triplanar26 = TriplanarSamplingSF( _HologramPattern, ase_worldPos, ase_worldNormal, 0.0, uv0_HologramPattern, 1.0, 0 );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float fresnelNdotV1 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode1 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV1, _Power ) );
				float2 uv_MainTex = i.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float4 tex2DNode46 = tex2D( _MainTex, uv_MainTex );
				float3 objToWorldDir69 = mul( unity_ObjectToWorld, float4( i.ase_normal, 0 ) ).xyz;
				float dotResult72 = dot( objToWorldDir69 , float3( 0,1,0 ) );
				float4 clampResult49 = clamp( ( pow( ( 1.0 - clampResult41 ) , _DistanceFalloff ) * triplanar26 * _EmissionColor * fresnelNode1 * tex2DNode46 * ( ( ( dotResult72 * _FauxLightingFactor ) + 1.0 ) - _FauxLightingFactor ) * float4( (i.ase_color).rgb , 0.0 ) * i.ase_color.a * tex2DNode46.a ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
				
				
				finalColor = clampResult49;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16600
7;171;1524;802;-590.5244;248.9669;1;True;True
Node;AmplifyShaderEditor.PosVertexDataNode;28;-421.0142,184.3353;Float;True;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;51;-393.7064,17.71051;Float;False;Property;_MaxDistance;Max Distance;5;0;Create;True;0;0;False;0;1;1.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;43;1470.929,221.1116;Float;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;52;-99.9129,173.3569;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;48;-150.2066,409.0103;Float;False;Property;_Pos;Pos;4;0;Create;True;0;0;False;1;Header(Position Falloff settings);0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformDirectionNode;69;774.1157,-731.8212;Float;True;Object;World;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;72;1037.156,-726.0724;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,1,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;39;58.72676,190.9867;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;1124.684,-491.7194;Float;False;Property;_FauxLightingFactor;Faux Lighting Factor;7;0;Create;True;0;0;False;1;Header(Others);0.37;0.37;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;76;1269.059,-717.469;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;41;299.0182,191.6999;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-114.903,-96.24103;Float;False;Property;_Power;Power;3;0;Create;True;0;0;False;0;1;1;0.1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;740.0871,306.3569;Float;False;Property;_DistanceFalloff;Distance Falloff;6;0;Create;True;0;0;False;0;0;3.96;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;79;1486.399,-713.9944;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;40;501.3315,179.5819;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;82;620.5244,-26.96686;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;42;265.4021,-351.8679;Float;False;0;81;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;81;209.6281,-558.9203;Float;True;Property;_HologramPattern;Hologram Pattern;1;0;Create;True;0;0;False;1;Header(Hologram Settings);None;0346e912964b79c43989ec1b47399e7c;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.ColorNode;27;1096.492,-379.3927;Float;False;Property;_EmissionColor;EmissionColor;2;1;[HDR];Create;True;0;0;False;0;1,1,1,0;11.79608,11.29412,11.29412,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;80;1631.229,-710.1013;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;1;192.4942,-167.4029;Float;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;53;793.0871,178.3569;Float;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;46;991.9666,241.8461;Float;True;Property;_MainTex;Main Texture;0;0;Create;False;0;0;False;0;None;4911733e0438ab944a8d2a1e922881ac;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TriplanarNode;26;640.9163,-359.1999;Float;True;Spherical;World;False;Holographic;_Holographic;white;1;None;Mid Texture 0;_MidTexture0;white;-1;None;Bot Texture 0;_BotTexture0;white;-1;None;Holographic Patteren;False;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;83;844.5244,-28.96686;Float;False;FLOAT3;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;45;1484.929,354.1117;Float;False;Property;_VertexOffset;Vertex Offset;8;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;1143.728,-74.44659;Float;False;9;9;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;1685.93,274.1116;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;49;1486.793,74.7106;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;1906.119,41.8079;Float;False;True;2;Float;ASEMaterialInspector;0;1;SLZ/Holographic Projection;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;False;-50;False;-1;-50;False;-1;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;True;0;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
WireConnection;52;0;28;0
WireConnection;52;1;51;0
WireConnection;69;0;43;0
WireConnection;72;0;69;0
WireConnection;39;0;52;0
WireConnection;39;1;48;0
WireConnection;76;0;72;0
WireConnection;76;1;77;0
WireConnection;41;0;39;0
WireConnection;79;0;76;0
WireConnection;40;0;41;0
WireConnection;80;0;79;0
WireConnection;80;1;77;0
WireConnection;1;3;47;0
WireConnection;53;0;40;0
WireConnection;53;1;54;0
WireConnection;26;0;81;0
WireConnection;26;3;42;0
WireConnection;83;0;82;0
WireConnection;13;0;53;0
WireConnection;13;1;26;0
WireConnection;13;2;27;0
WireConnection;13;3;1;0
WireConnection;13;4;46;0
WireConnection;13;5;80;0
WireConnection;13;6;83;0
WireConnection;13;7;82;4
WireConnection;13;8;46;4
WireConnection;44;0;43;0
WireConnection;44;1;45;0
WireConnection;49;0;13;0
WireConnection;0;0;49;0
WireConnection;0;1;44;0
ASEEND*/
//CHKSM=8D84D2FB20BBD4BA63BBA270344CA314677BE841