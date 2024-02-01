// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Holographic Portal"
{
	Properties
	{
		_CubeBG("CubeBG", CUBE) = "black" {}
		[HDR]_ScreenColor("ScreenColor", Color) = (1,1,1,1)
		_BumpMap("BumpMap", 2D) = "bump" {}
		_NormalScale("NormalScale", Float) = 1
		_FresnelBlur("FresnelBlur", Range( 0 , 10)) = 0
		_Pos("Pos", Vector) = (0,0,0,0)
		_Pos2("Pos2", Vector) = (0,0,0,0)
		_Boxscale("Box scale", Vector) = (0,0,0,0)
		_Min("Min", Range( 0 , 1)) = 0
		_Max("Max", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha , SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			float3 viewDir;
			INTERNAL_DATA
		};

		uniform samplerCUBE _CubeBG;
		uniform float3 _Boxscale;
		uniform float3 _Pos;
		uniform float3 _Pos2;
		uniform float _NormalScale;
		uniform sampler2D _BumpMap;
		uniform float4 _BumpMap_ST;
		uniform float _FresnelBlur;
		uniform float4 _ScreenColor;
		uniform float _Min;
		uniform float _Max;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Normal = float3(0,0,1);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 objToWorld126 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float3 break77 = ( (  ( -ase_worldViewDir - 0.0 > 0.0 ? ( _Boxscale + _Pos ) : -ase_worldViewDir - 0.0 <= 0.0 && -ase_worldViewDir + 0.0 >= 0.0 ? 0.0 : ( -_Boxscale + _Pos2 ) )  - ( ase_worldPos - objToWorld126 ) ) / -ase_worldViewDir );
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 normalizeResult21 = normalize( i.viewDir );
			float dotResult20 = dot( UnpackScaleNormal( tex2D( _BumpMap, uv_BumpMap ), _NormalScale ) , normalizeResult21 );
			float4 temp_output_12_0 = ( texCUBElod( _CubeBG, float4( ( ( -ase_worldViewDir * min( min( break77.x , break77.y ) , break77.z ) ) + ( ( ase_worldPos - objToWorld126 ) - _Pos ) ), ( ( 1.0 - dotResult20 ) * _FresnelBlur )) ) * _ScreenColor );
			o.Emission = temp_output_12_0.rgb;
			float2 temp_cast_1 = (0.0).xx;
			float smoothstepResult138 = smoothstep( _Min , _Max , ( 1.0 - ( distance( ( i.uv_texcoord + float2( -0.5,-0.5 ) ) , temp_cast_1 ) * 2.0 ) ));
			o.Alpha = smoothstepResult138;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15800
1989;2109;1524;982;-623.6471;-133.7791;1;True;True
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;6;-3795.481,-283.0136;Float;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;73;-3118.625,773.5765;Float;False;Property;_Boxscale;Box scale;15;0;Create;True;0;0;False;0;0,0,0;500,50,500;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;72;-3073.384,1062.442;Float;False;Property;_Pos;Pos;13;0;Create;True;0;0;False;0;0,0,0;0,3.99,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;104;-3070.449,1255.855;Float;False;Property;_Pos2;Pos2;14;0;Create;True;0;0;False;0;0,0,0;0,50,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;84;-2757.575,946.9216;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;7;-3525.523,-268.1664;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;71;-3585.578,338.8884;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformPositionNode;126;-3533.31,525.8633;Float;False;Object;World;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-2713.506,1168.843;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;-2845.367,806.2659;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;117;-3001.871,472.5053;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;102;-2306.436,416.4436;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCIf;83;-2534.372,688.8364;Float;False;6;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;116;-2754.957,436.7593;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;74;-2229.187,567.8656;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;75;-1994.823,505.3764;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-3368.622,-587.332;Float;False;Property;_NormalScale;NormalScale;6;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;22;-3413.815,-438.7008;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;77;-1775.928,669.347;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;13;-3153.333,-634.7465;Float;True;Property;_BumpMap;BumpMap;5;0;Create;True;0;0;False;0;None;b7090b2e6e84a074386ba1a0caad9c17;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;131;267.9987,415.1665;Float;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMinOpNode;76;-1487.128,654.9474;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;21;-3171.815,-434.7008;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;133;315.9987,682.1658;Float;False;Constant;_Float1;Float 1;15;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;134;528.9996,428.1665;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.5,-0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;20;-2840.596,-459.1613;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;78;-1347.728,680.3478;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1250.528,568.9465;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;41;-2574.462,-321.2434;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;81;-1684.628,1044.993;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DistanceOpNode;132;789.999,487.1664;Float;True;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2664.302,-108.1178;Float;False;Property;_FresnelBlur;FresnelBlur;11;0;Create;True;0;0;False;0;0;4.17;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;1030.998,514.1666;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-1055.48,549.4756;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-2331.791,-408.7857;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;11;-563.9006,356.8009;Float;False;Property;_ScreenColor;ScreenColor;4;1;[HDR];Create;True;0;0;False;0;1,1,1,1;3.688605,3.688605,3.688605,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;139;1287.147,802.7791;Float;False;Property;_Min;Min;16;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4;-876.7577,241.4463;Float;True;Property;_CubeBG;CubeBG;2;0;Create;True;0;0;False;0;None;56a68e301a0ff55469ae441c0112d256;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;136;1269.999,562.1664;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;140;1303.147,903.7791;Float;False;Property;_Max;Max;17;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;178.7686,96.86987;Float;False;Property;_Smoothness;Smoothness;9;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-147.0273,-476.3199;Float;False;Property;_Color;Color;3;0;Create;True;0;0;False;0;0,0,0,0;0.03270737,0.1415094,0.03270737,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;55;-3464.195,50.03834;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RelayNode;127;-605.826,59.15446;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-3606.944,103.7697;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;109;-3316.039,-234.9975;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;111;172.4456,24.64542;Float;False;Property;_Metallic;Metallic;10;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;128;741.3812,-167.7589;Float;False;Constant;_Float0;Float 0;15;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-248.0273,-305.3199;Float;True;Property;_MainTex;MainTex;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;45;128.2208,686.8731;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;138;1482.147,550.7791;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;62;-2900.121,-92.15472;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RotatorNode;54;-3304.195,78.03832;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;44;-279.98,686.8731;Float;True;Property;_EmissionMask2;EmissionMask2;8;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;128.9726,-281.32;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-194.861,277.2519;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;35;-230.9206,447.4391;Float;True;Property;_EmissionMask;Emission Mask;7;0;Create;True;0;0;False;0;None;03ad506bc40f22747a5f991faf00f9d8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;57;-3136.195,237.0384;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DynamicAppendNode;56;-2743.586,268.7626;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-3923.679,49.1406;Float;False;Property;_Rotation;Rotation;12;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;227.1576,240.4339;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PiNode;58;-3858.495,129.9314;Float;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;137;995.5967,-63.57397;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;SLZ/Holographic Portal;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;Back;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;2;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;84;0;73;0
WireConnection;7;0;6;0
WireConnection;108;0;84;0
WireConnection;108;1;104;0
WireConnection;103;0;73;0
WireConnection;103;1;72;0
WireConnection;117;0;71;0
WireConnection;117;1;126;0
WireConnection;102;0;7;0
WireConnection;83;0;102;0
WireConnection;83;2;103;0
WireConnection;83;4;108;0
WireConnection;116;0;117;0
WireConnection;74;0;83;0
WireConnection;74;1;116;0
WireConnection;75;0;74;0
WireConnection;75;1;102;0
WireConnection;77;0;75;0
WireConnection;13;5;14;0
WireConnection;76;0;77;0
WireConnection;76;1;77;1
WireConnection;21;0;22;0
WireConnection;134;0;131;0
WireConnection;20;0;13;0
WireConnection;20;1;21;0
WireConnection;78;0;76;0
WireConnection;78;1;77;2
WireConnection;79;0;102;0
WireConnection;79;1;78;0
WireConnection;41;0;20;0
WireConnection;81;0;116;0
WireConnection;81;1;72;0
WireConnection;132;0;134;0
WireConnection;132;1;133;0
WireConnection;135;0;132;0
WireConnection;80;0;79;0
WireConnection;80;1;81;0
WireConnection;42;0;41;0
WireConnection;42;1;39;0
WireConnection;4;1;80;0
WireConnection;4;2;42;0
WireConnection;136;0;135;0
WireConnection;55;0;109;0
WireConnection;55;1;109;2
WireConnection;127;0;20;0
WireConnection;59;0;51;0
WireConnection;59;1;58;0
WireConnection;109;0;7;0
WireConnection;45;0;44;0
WireConnection;138;0;136;0
WireConnection;138;1;139;0
WireConnection;138;2;140;0
WireConnection;54;0;55;0
WireConnection;54;2;59;0
WireConnection;8;0;3;0
WireConnection;8;1;9;0
WireConnection;12;0;4;0
WireConnection;12;1;11;0
WireConnection;57;0;54;0
WireConnection;56;0;57;0
WireConnection;56;1;109;1
WireConnection;56;2;57;1
WireConnection;36;0;12;0
WireConnection;36;1;35;0
WireConnection;137;2;12;0
WireConnection;137;9;138;0
ASEEND*/
//CHKSM=943D5D49B3A4ACFAA47AE976B57AF4B00B080F95