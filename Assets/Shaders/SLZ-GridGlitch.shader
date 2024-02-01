// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Grid Glitch"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
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
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
			};

			uniform float4 _Color;
			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord.xyz = ase_worldPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.zw = 0;
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
				float3 ase_worldPos = i.ase_texcoord.xyz;
				float3 temp_output_5_0 = ( ase_worldPos * 100.0 * UNITY_PI );
				float3 break13 = sin( temp_output_5_0 );
				float2 uv017 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break22 = sin( ( uv017 * float2( 3.15,3.15 ) ) );
				float clampResult37 = clamp( ( ( ( 1.0 - min( break22.x , break22.y ) ) * 2.0 ) - 1.0 ) , -0.5 , 1.0 );
				float4 lerpResult10 = lerp( ( ( _Color * max( max( break13.x , break13.z ) , break13.y ) ) + clampResult37 ) , float4( (i.ase_color).rgb , 0.0 ) , i.ase_color.a);
				
				
				finalColor = lerpResult10;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16600
-39;674;1524;633;999.4182;429.79;1.875566;True;True
Node;AmplifyShaderEditor.CommentaryNode;32;-606.7617,411.9513;Float;False;1510.895;349;Glow UV edges;6;17;30;22;29;28;31;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;17;-556.7618,461.9513;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-272.825,488.4342;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;3.15,3.15;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SinOpNode;29;-96.67966,486.7404;Float;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-249,-46.5;Float;False;Constant;_Tiling;Tiling;0;0;Create;True;0;0;False;0;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;8;-232,49.5;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;3;-478,-139.5;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-90.13349,-18.33934;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;22;123.5017,498.5964;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SinOpNode;7;151.5449,-276.0379;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMinOpNode;28;392.7974,496.9026;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;13;439.8322,-197.3272;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.OneMinusNode;31;688.6818,490.1043;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;987.4764,579.5242;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;12;514.8322,-60.32721;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;36;1319.048,569.829;Float;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;14;789.8322,-102.3272;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;16;472.2935,-488.1503;Float;False;Property;_Color;Color;0;0;Create;True;0;0;False;0;1,1,1,1;0.495283,0.8702697,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;1166.096,-233.0946;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;9;2036.074,-561.9785;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;37;1318.78,55.98183;Float;False;3;0;FLOAT;0;False;1;FLOAT;-0.5;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;11;2194.074,-547.9785;Float;False;FLOAT3;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;1534.24,-245.7158;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FractNode;4;191,-7.5;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;10;2286.073,-427.9785;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;2701.941,-369.3628;Float;False;True;2;Float;ASEMaterialInspector;0;1;SLZ/Grid Glitch;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;0;False;False;False;False;False;False;False;False;False;True;0;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;0
WireConnection;30;0;17;0
WireConnection;29;0;30;0
WireConnection;5;0;3;0
WireConnection;5;1;6;0
WireConnection;5;2;8;0
WireConnection;22;0;29;0
WireConnection;7;0;5;0
WireConnection;28;0;22;0
WireConnection;28;1;22;1
WireConnection;13;0;7;0
WireConnection;31;0;28;0
WireConnection;35;0;31;0
WireConnection;12;0;13;0
WireConnection;12;1;13;2
WireConnection;36;0;35;0
WireConnection;14;0;12;0
WireConnection;14;1;13;1
WireConnection;15;0;16;0
WireConnection;15;1;14;0
WireConnection;37;0;36;0
WireConnection;11;0;9;0
WireConnection;33;0;15;0
WireConnection;33;1;37;0
WireConnection;4;0;5;0
WireConnection;10;0;33;0
WireConnection;10;1;11;0
WireConnection;10;2;9;4
WireConnection;1;0;10;0
ASEEND*/
//CHKSM=99D87C42E593B26FD0C3E31826D0A9515AF1024C