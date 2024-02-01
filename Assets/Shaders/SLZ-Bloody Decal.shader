// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Multiplicative Decal"
{
	Properties
	{
		[HDR][PerRendererData]_Color("Color", Color) = (0.5,0,0,1)
		_OffsetUnits("Offset Units", Int) = -1
		_OffsetFactor("Offset Factor", Int) = -1
		[PerRendererData]_TexArraySelection("TexArraySelection", Int) = 0
		_TextureArray("Texture Array", 2DArray ) = "" {}
		[PerRendererData]_Scaler("Scaler", Range( 0 , 1)) = 0
	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="AlphaTest+200" }
		LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend DstColor SrcColor
		BlendOp Add
		Cull Back
		ColorMask RGB
		ZWrite Off
		ZTest LEqual
		Offset [_OffsetFactor] , [_OffsetUnits]
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM



#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
		//only defining to not throw compilation error over Unity 5.5
		#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
			};

			uniform int _OffsetUnits;
			uniform int _OffsetFactor;
			uniform float4 _Color;
			uniform UNITY_DECLARE_TEX2DARRAY( _TextureArray );
			uniform float4 _TextureArray_ST;
			uniform int _TexArraySelection;
			uniform float _Scaler;
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_color = v.color;
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				float3 vertexValue =  float3(0,0,0) ;
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
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				float4 temp_output_13_0 = ( _Color * i.ase_color );
				float2 uv_TextureArray = i.ase_texcoord.xy * _TextureArray_ST.xy + _TextureArray_ST.zw;
				float4 texArray18 = UNITY_SAMPLE_TEX2DARRAY(_TextureArray, float3(uv_TextureArray, (float)_TexArraySelection)  );
				float clampResult12 = clamp( (0.0 + (( texArray18.x + ( 1.0 - ( (temp_output_13_0).a * _Scaler ) ) ) - 0.8) * (1.0 - 0.0) / (1.0 - 0.8)) , 0.0 , 1.0 );
				float3 lerpResult8 = lerp( (temp_output_13_0).rgb , (float4(1,1,1,1)).rgb , clampResult12);
				float3 temp_output_42_0 = ( lerpResult8 * float3( 0.5,0.5,0.5 ) );
				
				
				finalColor = float4( temp_output_42_0 , 0.0 );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16900
2032;2016;1417;1068;1668.45;1004.231;1.562031;True;True
Node;AmplifyShaderEditor.VertexColorNode;4;-530.9514,-445.0533;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-557.0515,-619.3537;Float;False;Property;_Color;Color;0;2;[HDR];[PerRendererData];Create;True;0;0;False;0;0.5,0,0,1;0.9,1.172192,4.867144,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-148.1758,-339.5073;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.SwizzleNode;15;-62.27466,-73.70816;Float;False;FLOAT;3;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-665.8103,26.42493;Float;False;Property;_Scaler;Scaler;5;1;[PerRendererData];Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;19;-995.2576,302.2918;Float;False;Property;_TexArraySelection;TexArraySelection;3;1;[PerRendererData];Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-313.8103,28.42493;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;17;-332.1419,180.1715;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureArrayNode;18;-710.8358,224.226;Float;True;Property;_TextureArray;Texture Array;4;0;Create;True;0;0;False;0;None;0;Object;-1;Auto;False;7;6;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-148.9032,256.1241;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;35;96.82544,245.3035;Float;True;5;0;FLOAT;0;False;1;FLOAT;0.8;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-637.121,-213.9123;Float;False;Constant;_Color0;Color 0;5;0;Create;True;0;0;False;0;1,1,1,1;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;21;-319.0041,-169.9751;Float;False;FLOAT3;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwizzleNode;14;123.167,-171.6594;Float;False;FLOAT3;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;12;456.4596,223.6824;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;8;507.564,-139.522;Float;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;1398.618,341.9055;Float;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;363.8254,512.3035;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;7;-1155.54,-254.5383;Float;False;Property;_OffsetUnits;Offset Units;1;0;Create;True;0;0;True;0;-1;-1;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;6;-1165.264,-330.7814;Float;False;Property;_OffsetFactor;Offset Factor;2;0;Create;True;0;0;True;0;-1;-1;0;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;39;1642.468,529.1028;Float;True;2;2;0;COLOR;0.5,0.5,0.5,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;38;865.8806,534.249;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;41;1129.236,609.6141;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;1343.483,621.5989;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;36;960.12,386.9167;Float;False;Property;_Color1;Color 1;6;1;[HDR];Create;True;0;0;False;0;0,0,0,0;0,1,0.7469664,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;1011.923,-252.608;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0.5,0.5,0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;1677.445,-201.6775;Float;False;True;2;Float;ASEMaterialInspector;0;1;SLZ/Multiplicative Decal;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;7;2;False;-1;3;False;-1;0;2;False;-1;0;False;-1;True;1;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;False;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;0;False;-1;True;True;-1;True;6;-1;True;7;True;2;RenderType=Transparent=RenderType;Queue=AlphaTest=Queue=200;True;2;0;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
WireConnection;13;0;3;0
WireConnection;13;1;4;0
WireConnection;15;0;13;0
WireConnection;28;0;15;0
WireConnection;28;1;29;0
WireConnection;17;0;28;0
WireConnection;18;1;19;0
WireConnection;24;0;18;1
WireConnection;24;1;17;0
WireConnection;35;0;24;0
WireConnection;21;0;9;0
WireConnection;14;0;13;0
WireConnection;12;0;35;0
WireConnection;8;0;14;0
WireConnection;8;1;21;0
WireConnection;8;2;12;0
WireConnection;43;0;42;0
WireConnection;43;1;40;0
WireConnection;39;1;40;0
WireConnection;38;0;12;0
WireConnection;41;0;38;0
WireConnection;41;1;38;0
WireConnection;41;2;38;0
WireConnection;41;3;38;0
WireConnection;40;0;36;0
WireConnection;40;1;41;0
WireConnection;42;0;8;0
WireConnection;5;0;42;0
ASEEND*/
//CHKSM=B874B72695F10C2CDF23EC15241D08C91B677B5D