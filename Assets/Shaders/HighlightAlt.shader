// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Custom/HighlightAlt"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[PerRendererData]_Color0("Color 0", Color) = (0,0,0,0)
		[PerRendererData]_Color1("Color 1", Color) = (0,0,0,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			half ASEVFace : VFACE;
			float4 screenPosition;
		};

		uniform float4 _Color0;
		uniform float4 _Color1;
		uniform float _Cutoff = 0.5;


		inline float Dither8x8Bayer( int x, int y )
		{
			const float dither[ 64 ] = {
				 1, 49, 13, 61,  4, 52, 16, 64,
				33, 17, 45, 29, 36, 20, 48, 32,
				 9, 57,  5, 53, 12, 60,  8, 56,
				41, 25, 37, 21, 44, 28, 40, 24,
				 3, 51, 15, 63,  2, 50, 14, 62,
				35, 19, 47, 31, 34, 18, 46, 30,
				11, 59,  7, 55, 10, 58,  6, 54,
				43, 27, 39, 23, 42, 26, 38, 22};
			int r = y * 8 + x;
			return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 ase_screenPos = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			o.screenPosition = ase_screenPos;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 temp_output_9_0 = ( _Color0 * ( 1.0 - i.ASEVFace ) );
			float4 ase_screenPos = i.screenPosition;
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 clipScreen6 = ase_screenPosNorm.xy * _ScreenParams.xy;
			float dither6 = Dither8x8Bayer( fmod(clipScreen6.x, 8), fmod(clipScreen6.y, 8) );
			float4 temp_output_8_0 = ( i.ASEVFace * _Color1 );
			float temp_output_15_0 = (max( temp_output_9_0 , temp_output_8_0 )).a;
			dither6 = step( dither6, temp_output_15_0 );
			o.Emission = ( ( temp_output_9_0 * dither6 ) + ( temp_output_8_0 * dither6 ) ).rgb;
			o.Alpha = 1;
			clip( dither6 - _Cutoff );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15800
7;7;1906;1004;1066.318;554.2479;1.3;True;True
Node;AmplifyShaderEditor.FaceVariableNode;2;-396,274;Float;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1;-395,46;Float;False;Property;_Color0;Color 0;1;1;[PerRendererData];Create;True;0;0;False;0;0,0,0,0;1,0.4146727,0,0.1333333;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;11;-237,253;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-409,375;Float;False;Property;_Color1;Color 1;2;1;[PerRendererData];Create;True;0;0;False;0;0,0,0,0;1,1,0.7028302,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-22.15131,343.9832;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-25,172;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;17;261.4662,233.6639;Float;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;16;407.8596,317.5394;Float;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;15;645.5604,322.8601;Float;False;False;False;False;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DitheringNode;6;947.064,353.8683;Float;False;1;False;3;0;FLOAT;0;False;1;SAMPLER2D;;False;2;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;1258.682,167.5643;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;1149.775,-34.11703;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;634.0105,483.8302;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;20;1305.07,-3.864814;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FresnelNode;25;345.0105,478.8302;Float;False;Standard;TangentNormal;ViewDir;False;5;0;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;23;851.0105,454.8302;Float;True;Property;_Texture0;Texture 0;3;0;Create;True;0;0;False;0;None;None;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1514.152,-52.20175;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;Custom/HighlightAlt;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;False;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;1;False;-1;1;False;-1;7;2;False;-1;3;False;-1;0;False;-1;0;False;-1;0;False;0.001;0.8602941,0.4491241,0.4491241,0;VertexScale;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;11;0;2;0
WireConnection;8;0;2;0
WireConnection;8;1;4;0
WireConnection;9;0;1;0
WireConnection;9;1;11;0
WireConnection;17;0;9;0
WireConnection;17;1;8;0
WireConnection;16;0;17;0
WireConnection;15;0;16;0
WireConnection;6;0;15;0
WireConnection;21;0;8;0
WireConnection;21;1;6;0
WireConnection;18;0;9;0
WireConnection;18;1;6;0
WireConnection;24;0;15;0
WireConnection;24;1;25;0
WireConnection;20;0;18;0
WireConnection;20;1;21;0
WireConnection;0;2;20;0
WireConnection;0;10;6;0
ASEEND*/
//CHKSM=382A22E6A9FA0D21668E7F844B5C2B691E1030CF