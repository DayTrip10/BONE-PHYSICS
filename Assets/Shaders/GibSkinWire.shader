// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/GibSkinWire"
{
	Properties
	{
		[NoScaleOffset]_MainTex("Main Texture", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,1)
		[HDR]_BloodyColor("BloodyColor", Color) = (1,1,1,0.5607843)
		[HideInInspector][PerRendererData]_NumberOfHits("Number Of Hits", Int) = 0
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
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"
			
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord : TEXCOORD0;
				float3 ase_normal : NORMAL;
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
			};

			uniform float4x4 EllipsoidPosArray[128];
			uniform int _NumberOfHits;
			uniform float4 _BloodyColor;
			uniform sampler2D _MainTex;
			uniform float4 _Color;
			float MyCustomExpression280( float4x4 Ellipsoids , float3 Posespace , int LoopNumber )
			{
				 float HitDistance = 1;
				for ( int i = 0; i <LoopNumber; i++ ){
				float3 LocalPosP = Posespace - EllipsoidPosArray[i][3].xyz;
				HitDistance =  min( HitDistance, clamp(  distance( mul( LocalPosP , EllipsoidPosArray[i] ) , float3( 0,0,0 ) ), 0 ,1)  );
				}
				return HitDistance;
			}
			
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord3.xyz = ase_worldPos;
				
				o.ase_texcoord.xyz = v.ase_texcoord1.xyz;
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
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
				fixed4 finalColor;
				float4x4 Ellipsoids280 = EllipsoidPosArray[0];
				float3 uv15 = i.ase_texcoord.xyz;
				uv15.xy = i.ase_texcoord.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float3 Posespace280 = uv15;
				int LoopNumber280 = _NumberOfHits;
				float localMyCustomExpression280 = MyCustomExpression280( Ellipsoids280 , Posespace280 , LoopNumber280 );
				float MessuredDistance169 = localMyCustomExpression280;
				float smoothstepResult332 = smoothstep( 0.8 , 1.0 , MessuredDistance169);
				float smoothstepResult337 = smoothstep( 0.0 , 0.05 , ( 1.0 - MessuredDistance169 ));
				float temp_output_333_0 = ( smoothstepResult332 * smoothstepResult337 );
				float4 Bloody342 = _BloodyColor;
				float2 uv_MainTex64 = i.ase_texcoord1.xy;
				float4 temp_output_263_0 = ( tex2D( _MainTex, uv_MainTex64 ) * _Color );
				float smoothstepResult309 = smoothstep( 0.2 , 0.8 , (temp_output_263_0).a);
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 ase_worldPos = i.ase_texcoord3.xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult307 = dot( ase_worldNormal , ase_worldViewDir );
				
				
				finalColor = max( ( ( temp_output_333_0 * Bloody342 ) + ( float4( ( (temp_output_263_0).rgb * smoothstepResult309 * dotResult307 ) , 0.0 ) * ( smoothstepResult332 + ( temp_output_333_0 * Bloody342 ) ) ) ) , float4( 0,0,0,0 ) );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16600
7;264;1524;663;-3934.112;692.7925;1.652425;True;True
Node;AmplifyShaderEditor.CommentaryNode;165;-157.8962,-2541.567;Float;False;2311.296;1928.043;Comment;47;48;89;88;86;99;76;74;78;104;72;75;77;106;73;156;109;157;97;125;47;126;96;160;162;163;159;161;127;166;169;130;174;175;176;209;210;211;214;215;239;240;241;266;298;299;300;342;Posespace Hits;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;48;-107.8962,-2045.979;Float;False;685.0583;457.7841;Posspace impacts;5;38;36;31;5;280;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GlobalArrayNode;36;-55.12887,-1726.196;Float;False;EllipsoidPosArray;0;128;3;False;False;0;1;False;Object;-1;4;0;INT;0;False;2;INT;0;False;1;INT;0;False;3;INT;0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.IntNode;38;-46.94784,-1826.057;Float;False;Property;_NumberOfHits;Number Of Hits;12;2;[HideInInspector];[PerRendererData];Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-57.89629,-1995.979;Float;False;1;-1;3;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;280;293.9821,-1851.512;Float;False; float HitDistance = 1@$$for ( int i = 0@ i <LoopNumber@ i++ ){$$float3 LocalPosP = Posespace - EllipsoidPosArray[i][3].xyz@$$HitDistance =  min( HitDistance, clamp(  distance( mul( LocalPosP , EllipsoidPosArray[i] ) , float3( 0,0,0 ) ), 0 ,1)  )@$$}$$return HitDistance@;1;False;3;True;Ellipsoids;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;In;sdads;Float;True;Posespace;FLOAT3;0,0,0;In;;Float;True;LoopNumber;INT;0;In;;Float;My Custom Expression;True;False;0;3;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;2;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;177;1668.231,-223.648;Float;False;525.8;682.4663;Variables;4;133;80;64;263;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;339;4206.775,-751.6669;Float;False;1034.296;617.0602;Hitoutline;8;332;333;337;334;311;343;347;348;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;169;591.1342,-1807.634;Float;False;MessuredDistance;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;264;1725.843,-342.4326;Float;False;Property;_Color;Color;1;0;Create;True;0;0;False;0;1,1,1,1;0.7075471,0.7075471,0.7075471,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;64;1718.231,-173.648;Float;True;Property;_MainTex;Main Texture;0;1;[NoScaleOffset];Create;False;0;0;False;0;None;a69d55bed79f1c940bab368cc38a6dab;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;263;2051.843,-170.4326;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;311;4248.822,-610.9621;Float;False;169;MessuredDistance;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;47;1643.43,-1761.654;Float;False;Property;_BloodyColor;BloodyColor;5;1;[HDR];Create;True;0;0;False;0;1,1,1,0.5607843;21.19372,0.6,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RelayNode;310;2532.4,-412.6387;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;334;4568.667,-539.6674;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;306;3041.329,-554.6787;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SwizzleNode;304;2704.021,-186.4606;Float;False;FLOAT;3;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;332;4575.987,-703.3459;Float;False;3;0;FLOAT;0;False;1;FLOAT;0.8;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;337;4617.667,-455.6673;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;342;1923.698,-1670.881;Float;False;Bloody;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;308;3050.47,-397.4958;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DotProductOpNode;307;3239.598,-506.1589;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;303;2727.021,-355.4606;Float;False;FLOAT3;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;343;4371.555,-232.8961;Float;False;342;Bloody;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;309;3009.936,-216.8652;Float;False;3;0;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;333;4967.709,-641.5527;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;345;4032.79,-46.31488;Float;False;204;160;Output tex;1;344;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;347;4742.331,-241.5732;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;302;3343.074,-195.6539;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;344;4082.79,3.68512;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;348;4975.777,-258.0029;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;346;5008.506,-58.64627;Float;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;207;-1008.781,-261.4375;Float;False;2002.218;639.0782;Comment;9;189;187;188;246;193;206;190;183;179;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;349;5176.869,-335.1735;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;236;1091.344,-2897.511;Float;False;267;229;Comment;1;234;Replace with Pose normal;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;338;4124.762,323.4073;Float;False;1345;624.9996;Scanline;13;327;328;326;325;319;324;330;321;322;323;331;315;340;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;183;-595.6402,7.407621;Float;False;241;210;Posespace;1;181;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;283;2901.897,282.5888;Float;False;877.6423;689.9533;Center hole spec;5;289;143;142;170;296;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;174;1921.389,-1149.252;Float;False;204;160;Bloody;1;171;;1,0.0990566,0.0990566,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;175;1921.403,-979.554;Float;False;204.0001;160;Normal;1;172;;0.5,0.5,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;176;1922.182,-805.6692;Float;False;204;160;Specular;1;173;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;335;5332.567,-84.30936;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RelayNode;86;666.139,-2235.298;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;143;3381.407,343.7697;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;96;772.1591,-1909.448;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;171;1971.389,-1099.252;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;330;5015.949,513.2376;Float;False;3;0;FLOAT;0;False;1;FLOAT;0.4;False;2;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;127;1110.37,-1239.982;Float;True;Property;_Bloody;Bloody;12;0;Create;True;0;0;False;0;None;a96581eb69cfd2e4b93e56eac104d0b0;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;266;659.4388,-917.5654;Float;False;Property;_BloodyNormalScale;Bloody Normal Scale;8;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;97;1440.123,-1656.383;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;298;1465.741,-849.4649;Float;False;Property;_BloodyMetallic;BloodyMetallic;9;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;297;3870.325,168.4551;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;126;1984.4,-1795.603;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;162;1501.055,-1008.169;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;129;2489.134,81.85724;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendOpsNode;213;2298.838,-1344.29;Float;False;VividLight;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;172;1974.192,-921.6085;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;331;5068.027,780.193;Float;False;Constant;_Float0;Float 0;16;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;1488.107,-1460.107;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;88;496.1389,-2227.598;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SinOpNode;321;4926.762,662.4071;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;195;3691.445,-889.9479;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;166;1768.956,-1226.666;Float;False;Hits;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;163;1645.033,-1010.4;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;3,3,3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;181;-583.6402,57.40746;Float;False;1;-1;3;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;161;1105.907,-849.1912;Float;True;Property;_TextureSample5;Texture Sample 5;15;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;296;2917.594,585.9684;Float;False;166;Hits;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwitchByFaceNode;279;4329.445,-1037.861;Float;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SwizzleNode;78;890.591,-2112.644;Float;False;FLOAT2;0;2;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;328;4443.762,833.407;Float;False;Property;_ScanlineDistance;Scanline Distance;15;0;Create;True;0;0;False;0;50;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;202;4074.162,-866.9605;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleTimeNode;325;4324.762,710.407;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;188;-498.5367,231.1391;Float;False;FLOAT3;0;1;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;340;4646.935,490.475;Float;False;169;MessuredDistance;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;323;5300.762,688.407;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;315;4269.339,553.0199;Float;False;1;-1;3;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;80;1740.551,258.6185;Float;True;Property;_BumpMap;Normal;2;1;[NoScaleOffset];Create;False;0;0;False;0;None;a4bf818179cacd744830c125cedd8bce;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;289;3397.505,505.8646;Float;False;3;0;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;72;1053.942,-2491.567;Float;True;Property;_BloodyTex;BloodyTex;4;1;[NoScaleOffset];Create;True;0;0;False;1;Header(Bloody Properties);None;b16415f2f06fcb14cae4d345fda40d45;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;167;1974.252,-399.9579;Float;False;166;Hits;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;187;-174.1741,46.00196;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;42;1113.319,-130.049;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;219;3635.158,-718.4578;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;125;1686.64,-1472.446;Float;False;VividLight;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;241;1738.598,-2120.524;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;136;2813.515,-94.3737;Float;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RelayNode;242;2159.914,-1924.196;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;214;1481.792,-1351.986;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;227;2306.512,-303.3094;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;104;983.454,-1807.24;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;1479.49,-717.2585;Float;False;Property;_BloodySmoothness;BloodySmoothness;10;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;238;1891.984,-2643.984;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TexturePropertyNode;159;644.4178,-1113.713;Float;True;Property;_BloodyNormal;BloodyNormal;7;2;[NoScaleOffset];[Normal];Create;True;0;0;False;0;None;None;True;bump;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;687.2795,-173.3307;Float;False;CutoutEllipsoidDistance;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GlobalArrayNode;193;-958.7809,-190.1823;Float;False;_ElipsoidMatrices;0;1;3;False;False;0;1;False;Object;-1;4;0;INT;0;False;2;INT;0;False;1;INT;0;False;3;INT;0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.GetLocalVarNode;209;974.8678,-1408.739;Float;False;206;CutoutEllipsoidDistance;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;99;689.1649,-1698.159;Float;False;Property;_Power;Power;13;0;Create;True;0;0;False;0;0.25;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;57;2484.747,-304.4061;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DistanceOpNode;190;297.889,-89.62183;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;239;1734.958,-2331.246;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;76;882.8132,-2192.43;Float;False;FLOAT2;1;2;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CustomExpressionNode;50;1501.916,2.254181;Float;False;  return tex2D(_OcclusionMap, UV)@;4;False;1;True;UV;FLOAT2;0,0;In;;Float;AO 2DSampler;True;False;0;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;240;1730.419,-2229.915;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;225.1385,-2208.598;Float;False;Property;_BloodyTexScale;Bloody Tex Scaling;6;0;Create;False;0;0;False;0;1;0.16;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;43;1469.646,-202.7031;Float;False;  return tex2D(_MainTex, UV)@;4;False;1;True;UV;FLOAT2;0,0;In;;Float;MainTex 2DSampler;True;False;0;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;132;2484.026,-174.4643;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SwizzleNode;74;883.924,-2273.549;Float;False;FLOAT2;0;1;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;189;-11.77777,-72.55127;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;319;4561.439,693.6349;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;194;3400.147,-748.3048;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;324;4608.762,572.4072;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;234;1141.344,-2847.511;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;130;1978.332,-1435.467;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;73;1421.753,-2402.451;Float;True;Property;_TextureSample0;Texture Sample 0;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;157;1991.375,-2085.87;Float;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;75;1422.865,-2201.321;Float;True;Property;_TextureSample1;Texture Sample 1;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;322;5138.762,682.407;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;244;1763.711,-2858.661;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;215;1479.792,-1259.986;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;210;1269.605,-1407.863;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VectorFromMatrixNode;179;-703.3745,236.1781;Float;False;Row;3;1;0;FLOAT4x4;1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;49;1495.391,-98.06308;Float;False;  return tex2D(_BumpMap, UV)@;4;False;1;True;UV;FLOAT2;0,0;In;;Float;Normal 2DSampler;True;False;0;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;1165.454,-1783.24;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;327;4174.762,810.407;Float;False;Property;_ScanlineTime;Scanline Time;14;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;235;1384.895,-2901.806;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;156;1979.695,-2251.418;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;77;1422.863,-1999.299;Float;True;Property;_TextureSample2;Texture Sample 2;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RelayNode;173;1974.071,-750.0019;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;160;1105.907,-1043.509;Float;True;Property;_TextureSample4;Texture Sample 4;15;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;300;1765.056,-783.8908;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;133;1722.14,31.82836;Float;True;Property;_MetallicGlossMap;MAS Metallic;3;1;[NoScaleOffset];Create;False;0;0;False;0;None;da8b83cb91859f944b601748117f3bcd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;170;2900.897,332.5887;Float;False;169;MessuredDistance;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;246;-986.5919,-73.3175;Float;False;Property;_NumberOfElipsoids;NumberOfElipsoids;11;2;[HideInInspector];[PerRendererData];Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.CustomExpressionNode;245;-94.83571,-387.2128;Float;False; float HitDistance = 1@$$for ( int i = 0@ i <LoopNumber@ i++ ){$$ HitDistance *= clamp(distance( mul( float4( ( Posespace - (Ellipsoids[0][3]) ) , 0.0 ), Ellipsoids[0] ) , float3( 0,0,0 ) ), 0 ,1)@$$$}$$return HitDistance@$;1;False;3;True;Ellipsoids;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;In;;Float;True;Posespace;FLOAT3;0,0,0;In;;Float;True;LoopNumber;INT;0;In;;Float;My Custom Expression;True;False;0;3;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;2;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;228;3909.407,-746.5067;Float;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldPosInputsNode;326;4356.762,373.4073;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CustomExpressionNode;31;332.162,-2011.43;Float;False; float HitDistance = 1@$for ( int i = 0@ i <In0@ i++ ){$ HitDistance *= clamp(  distance( Posespace.xyz , EllipsoidPosArray[i].xyz) / EllipsoidPosArray[i].w, 0,1  )@$}$$//EllipsoidPosArray[i]$$return HitDistance@$;1;False;3;True;In0;INT;1;In;;Float;True;Posespace;FLOAT3;0,0,0;In;;Float;True;PosArray;FLOAT4;0,0,0,0;In;;Float;Distance Loop;True;False;0;3;0;INT;1;False;1;FLOAT3;0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;230;2579.295,-1302.056;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;142;3197.946,354.8798;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;109;1358.353,-1767.411;Float;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;352;5557.158,-71.48066;Float;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;301;5942.211,-6.501646;Float;False;True;2;Float;ASEMaterialInspector;0;1;SLZ/GibSkinWire;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;True;0;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
WireConnection;280;0;36;0
WireConnection;280;1;5;0
WireConnection;280;2;38;0
WireConnection;169;0;280;0
WireConnection;263;0;64;0
WireConnection;263;1;264;0
WireConnection;310;0;263;0
WireConnection;334;0;311;0
WireConnection;304;0;310;0
WireConnection;332;0;311;0
WireConnection;337;0;334;0
WireConnection;342;0;47;0
WireConnection;307;0;306;0
WireConnection;307;1;308;0
WireConnection;303;0;310;0
WireConnection;309;0;304;0
WireConnection;333;0;332;0
WireConnection;333;1;337;0
WireConnection;347;0;333;0
WireConnection;347;1;343;0
WireConnection;302;0;303;0
WireConnection;302;1;309;0
WireConnection;302;2;307;0
WireConnection;344;0;302;0
WireConnection;348;0;332;0
WireConnection;348;1;347;0
WireConnection;346;0;344;0
WireConnection;346;1;348;0
WireConnection;349;0;333;0
WireConnection;349;1;343;0
WireConnection;335;0;349;0
WireConnection;335;1;346;0
WireConnection;86;0;88;0
WireConnection;143;0;142;0
WireConnection;96;0;169;0
WireConnection;96;1;73;1
WireConnection;171;0;130;0
WireConnection;330;0;340;0
WireConnection;127;0;159;0
WireConnection;127;1;74;0
WireConnection;127;5;266;0
WireConnection;97;0;109;0
WireConnection;297;0;136;1
WireConnection;297;1;289;0
WireConnection;126;0;73;1
WireConnection;126;1;47;0
WireConnection;162;0;127;0
WireConnection;162;1;160;0
WireConnection;162;2;161;0
WireConnection;129;0;172;0
WireConnection;129;1;80;0
WireConnection;129;2;167;0
WireConnection;213;0;215;0
WireConnection;213;1;242;0
WireConnection;172;0;163;0
WireConnection;211;0;97;0
WireConnection;211;1;210;0
WireConnection;88;0;5;0
WireConnection;88;1;89;0
WireConnection;321;0;324;0
WireConnection;195;3;219;0
WireConnection;166;0;125;0
WireConnection;163;0;162;0
WireConnection;161;0;159;0
WireConnection;161;1;78;0
WireConnection;161;5;266;0
WireConnection;279;0;202;0
WireConnection;78;0;86;0
WireConnection;202;0;195;0
WireConnection;325;0;327;0
WireConnection;188;0;179;0
WireConnection;323;0;322;0
WireConnection;323;1;331;0
WireConnection;323;2;330;0
WireConnection;289;0;143;0
WireConnection;187;0;181;0
WireConnection;187;1;188;0
WireConnection;219;0;194;0
WireConnection;125;0;211;0
WireConnection;125;1;242;0
WireConnection;241;0;238;1
WireConnection;241;1;77;1
WireConnection;136;0;132;0
WireConnection;242;0;157;0
WireConnection;214;0;210;0
WireConnection;227;0;167;0
WireConnection;104;0;169;0
WireConnection;104;1;99;0
WireConnection;238;0;244;0
WireConnection;206;0;245;0
WireConnection;57;0;171;0
WireConnection;57;1;263;0
WireConnection;57;2;227;0
WireConnection;190;0;189;0
WireConnection;239;0;73;1
WireConnection;239;1;238;2
WireConnection;76;0;86;0
WireConnection;50;0;42;0
WireConnection;240;0;238;0
WireConnection;240;1;75;1
WireConnection;43;0;42;0
WireConnection;132;0;173;0
WireConnection;132;1;133;0
WireConnection;132;2;167;0
WireConnection;74;0;86;0
WireConnection;189;0;187;0
WireConnection;189;1;193;0
WireConnection;319;0;326;2
WireConnection;319;1;328;0
WireConnection;194;0;230;0
WireConnection;324;0;319;0
WireConnection;324;1;325;0
WireConnection;130;0;126;0
WireConnection;130;1;47;0
WireConnection;130;2;47;4
WireConnection;73;0;72;0
WireConnection;73;1;74;0
WireConnection;157;0;156;0
WireConnection;75;0;72;0
WireConnection;75;1;76;0
WireConnection;322;0;321;0
WireConnection;244;0;235;0
WireConnection;215;0;214;0
WireConnection;210;0;209;0
WireConnection;179;0;193;0
WireConnection;49;0;42;0
WireConnection;106;0;104;0
WireConnection;235;0;234;0
WireConnection;156;0;239;0
WireConnection;156;1;240;0
WireConnection;156;2;241;0
WireConnection;77;0;72;0
WireConnection;77;1;78;0
WireConnection;173;0;300;0
WireConnection;160;0;159;0
WireConnection;160;1;76;0
WireConnection;160;5;266;0
WireConnection;300;0;298;0
WireConnection;300;2;299;0
WireConnection;245;0;193;0
WireConnection;245;1;181;0
WireConnection;245;2;246;0
WireConnection;228;0;195;0
WireConnection;228;1;219;0
WireConnection;31;0;38;0
WireConnection;31;1;5;0
WireConnection;31;2;36;0
WireConnection;230;0;213;0
WireConnection;142;0;170;0
WireConnection;109;0;106;0
WireConnection;352;0;335;0
WireConnection;301;0;352;0
ASEEND*/
//CHKSM=BF67496590D6744B450E4241AAF68E6170371694