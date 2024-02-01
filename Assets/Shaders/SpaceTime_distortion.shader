// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Spacetime Distortion"
{
	Properties
	{
		_Distortion2("Distortion2", 2D) = "bump" {}
		_Distortion("Distortion", 2D) = "bump" {}
		_DistortionAmount2("Distortion Amount2", Float) = 0
		_DistortionAmount("Distortion Amount", Float) = 0
		_ColorAberration("Color Aberration", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		ZWrite Off
		ZTest Less
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.5
		#pragma surface surf Unlit keepalpha noshadow exclude_path:deferred noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform UNITY_DECLARE_TEX2DARRAY( _CameraOpaqueTexture );
		uniform sampler2D _Distortion2;
		uniform float4 _Distortion2_ST;
		uniform float _DistortionAmount2;
		uniform sampler2D _Distortion;
		uniform float4 _Distortion_ST;
		uniform float _DistortionAmount;
		uniform float _ColorAberration;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Normal = float3(0,0,1);
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 temp_output_15_0 = (ase_screenPosNorm).xy;
			float2 uv0_Distortion2 = i.uv_texcoord * _Distortion2_ST.xy + _Distortion2_ST.zw;
			float cos29 = cos( 1.0 * _Time.y );
			float sin29 = sin( 1.0 * _Time.y );
			float2 rotator29 = mul( uv0_Distortion2 - float2( 0.5,0.5 ) , float2x2( cos29 , -sin29 , sin29 , cos29 )) + float2( 0.5,0.5 );
			float2 uv_Distortion = i.uv_texcoord * _Distortion_ST.xy + _Distortion_ST.zw;
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
			float3 tangentToViewDir = mul( UNITY_MATRIX_V, float4( mul( ase_tangentToWorldFast, BlendNormals( UnpackNormal( tex2D( _Distortion2, rotator29 ) ) , UnpackScaleNormal( tex2D( _Distortion, uv_Distortion ), _DistortionAmount2 ) ) ), 0 ) ).xyz;
			float2 temp_output_67_0 = (tangentToViewDir).xy;
			float4 texArray3 = UNITY_SAMPLE_TEX2DARRAY(_CameraOpaqueTexture, float3(( temp_output_15_0 + ( temp_output_67_0 * ( _DistortionAmount + _ColorAberration ) ) ), (float)unity_StereoEyeIndex)  );
			float4 _Vector0 = float4(1,0.5,0.33,0);
			float4 temp_output_100_0 = ( texArray3 * (_Vector0).xyzw );
			float4 texArray40 = UNITY_SAMPLE_TEX2DARRAY(_CameraOpaqueTexture, float3(( temp_output_15_0 + ( temp_output_67_0 * _DistortionAmount ) ), (float)unity_StereoEyeIndex)  );
			float4 temp_output_102_0 = ( texArray40 * (_Vector0).yxyw );
			float4 blendOpSrc109 = temp_output_100_0;
			float4 blendOpDest109 = temp_output_102_0;
			float4 texArray41 = UNITY_SAMPLE_TEX2DARRAY(_CameraOpaqueTexture, float3(( temp_output_15_0 + ( temp_output_67_0 * ( _DistortionAmount - _ColorAberration ) ) ), (float)unity_StereoEyeIndex)  );
			float4 temp_output_103_0 = ( texArray41 * (_Vector0).zyxw );
			float4 blendOpSrc110 = 	max( blendOpSrc109, blendOpDest109 );
			float4 blendOpDest110 = temp_output_103_0;
			o.Emission = 	max( blendOpSrc110, blendOpDest110 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16600
7;75;1417;976;136.7267;293.046;1;True;True
Node;AmplifyShaderEditor.TextureCoordinatesNode;32;-3643.257,-162.3539;Float;False;0;28;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RotatorNode;29;-3225.958,-62.25433;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-3177.861,-237.7541;Float;False;Property;_DistortionAmount2;Distortion Amount2;7;0;Create;True;0;0;False;0;0;0.48;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;9;-2751.24,-77.71105;Float;True;Property;_Distortion;Distortion;6;0;Create;True;0;0;False;0;None;93e5193ab8730504d970b2c5f1d4a05c;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;28;-2797.537,-295.2833;Float;True;Property;_Distortion2;Distortion2;5;0;Create;True;0;0;False;0;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;30;-2402.329,-189.6371;Float;True;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-2026.157,243.4492;Float;False;Property;_ColorAberration;Color Aberration;9;0;Create;True;0;0;False;0;0;0.052;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1991.006,57.59313;Float;False;Property;_DistortionAmount;Distortion Amount;8;0;Create;True;0;0;False;0;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;70;-1942.872,-261.6177;Float;True;Tangent;View;False;Fast;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ScreenPosInputsNode;6;-1956.368,-455.9925;Float;True;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;98;-1509.144,167.9406;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;67;-1623.983,-233.7037;Float;False;FLOAT2;0;1;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;75;-1338.48,21.96667;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;93;-1514.653,295.0078;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-1326.614,176.9925;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;15;-1607.47,-453.6967;Float;True;FLOAT2;0;1;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;76;-858.2392,309.5534;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;71;-897.4546,-10.66101;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.IntNode;5;-870.7618,229.4676;Float;False;Global;unity_StereoEyeIndex;unity_StereoEyeIndex;1;0;Fetch;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;99;-1296.719,319.294;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;4;-1708.446,-670.9421;Float;True;Global;_CameraOpaqueTexture;_CameraOpaqueTexture;4;0;Create;True;0;0;False;0;None;None;False;white;LockedToTexture2DArray;Texture2DArray;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.Vector4Node;106;-8.207825,370.7542;Float;False;Constant;_Vector0;Vector 0;10;0;Create;True;0;0;False;0;1,0.5,0.33,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;107;-87.20782,34.75423;Float;False;FLOAT4;1;0;1;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SwizzleNode;104;-89.20782,-109.2458;Float;False;FLOAT4;0;1;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureArrayNode;3;-421.9999,-167;Float;True;Property;_TextureArray0;Texture Array 0;3;1;[PerRendererData];Create;True;0;0;False;0;None;0;Object;-1;Auto;False;7;6;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureArrayNode;40;-421.3659,40.75453;Float;True;Property;_TextureArray1;Texture Array 1;2;1;[PerRendererData];Create;True;0;0;False;0;None;0;Object;-1;Auto;False;7;6;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;77;-841.58,565.7189;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;108;-69.20782,180.7542;Float;False;FLOAT4;2;1;0;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;86.81663,-203.043;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;102;100.7922,16.75424;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureArrayNode;41;-417.4657,253.9546;Float;True;Property;_TextureArray2;Texture Array 2;1;1;[PerRendererData];Create;True;0;0;False;0;None;0;Object;-1;Auto;False;7;6;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;109;330.7921,300.7542;Float;True;Lighten;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;103;113.7922,158.7542;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;53;367.1834,-186.2295;Float;False;Constant;_Int1;Int 1;10;0;Create;True;0;0;False;0;3;0;0;1;INT;0
Node;AmplifyShaderEditor.BlendOpsNode;110;589.0005,395.7903;Float;True;Lighten;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-3433.342,28.8808;Float;False;Constant;_Float0;Float 0;7;0;Create;True;0;0;False;0;2.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;36;-2037.342,375.8809;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;24;-2772.045,400.7882;Float;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;50;384.1834,-112.2295;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;52;596.1833,-146.2295;Float;False;2;0;COLOR;0,0,0,0;False;1;INT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;-2481.563,403.1974;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;25;-2223.045,389.8882;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;42;351.8151,30.16945;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;23;-3496.145,304.5884;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;22;814.5809,-109.5852;Float;False;True;3;Float;ASEMaterialInspector;0;0;Unlit;SLZ/Spacetime Distortion;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;2;False;-1;1;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;1;False;-1;1;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;True;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;29;0;32;0
WireConnection;9;5;31;0
WireConnection;28;1;29;0
WireConnection;30;0;28;0
WireConnection;30;1;9;0
WireConnection;70;0;30;0
WireConnection;98;0;10;0
WireConnection;98;1;47;0
WireConnection;67;0;70;0
WireConnection;75;0;67;0
WireConnection;75;1;10;0
WireConnection;93;0;10;0
WireConnection;93;1;47;0
WireConnection;94;0;67;0
WireConnection;94;1;98;0
WireConnection;15;0;6;0
WireConnection;76;0;15;0
WireConnection;76;1;75;0
WireConnection;71;0;15;0
WireConnection;71;1;94;0
WireConnection;99;0;67;0
WireConnection;99;1;93;0
WireConnection;107;0;106;0
WireConnection;104;0;106;0
WireConnection;3;6;4;0
WireConnection;3;0;71;0
WireConnection;3;1;5;0
WireConnection;40;6;4;0
WireConnection;40;0;76;0
WireConnection;40;1;5;0
WireConnection;77;0;15;0
WireConnection;77;1;99;0
WireConnection;108;0;106;0
WireConnection;100;0;3;0
WireConnection;100;1;104;0
WireConnection;102;0;40;0
WireConnection;102;1;107;0
WireConnection;41;6;4;0
WireConnection;41;0;77;0
WireConnection;41;1;5;0
WireConnection;109;0;100;0
WireConnection;109;1;102;0
WireConnection;103;0;41;0
WireConnection;103;1;108;0
WireConnection;110;0;109;0
WireConnection;110;1;103;0
WireConnection;36;0;25;0
WireConnection;24;0;23;0
WireConnection;50;0;100;0
WireConnection;50;1;102;0
WireConnection;50;2;103;0
WireConnection;52;0;50;0
WireConnection;52;1;53;0
WireConnection;26;0;24;0
WireConnection;25;0;26;0
WireConnection;42;0;3;1
WireConnection;42;1;40;2
WireConnection;42;2;41;3
WireConnection;22;2;110;0
ASEEND*/
//CHKSM=6774C0DFAE51E62A8F2851740079F0570C82414A