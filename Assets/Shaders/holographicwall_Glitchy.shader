// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Holographic Wall Glitchy"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		[NoScaleOffset]_CubeBG3("CubeBG3", CUBE) = "black" {}
		[NoScaleOffset]_CubeBG2("CubeBG2", CUBE) = "black" {}
		[NoScaleOffset]_CubeBG("CubeBG", CUBE) = "black" {}
		_Color("Color", Color) = (0,0,0,0)
		[HDR]_ScreenColor("ScreenColor", Color) = (1,1,1,1)
		_BumpMap("BumpMap", 2D) = "bump" {}
		_NormalScale("NormalScale", Float) = 1
		_EmissionMask("Emission Mask", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_FresnelBlur("FresnelBlur", Range( 0 , 10)) = 0
		_Pos("Pos", Vector) = (0,0,0,0)
		_Pos2("Pos2", Vector) = (0,0,0,0)
		_Boxscale("Box scale", Vector) = (0,0,0,0)
		_ScreenTimeGlitch("Screen Time Glitch", Float) = 0.1
		_PixelCount("PixelCount", Int) = 128
		_PlenopticEffect("Plenoptic Effect", Float) = 0
		_NoiseIntensity("Noise Intensity", Float) = 0
		_NoiseSize("Noise Size", Vector) = (0.01,3,0,0)
		[Gamma]_Masking("Masking", 2D) = "gray" {}
		_Screen1("Screen 1", Range( 0 , 1)) = 1
		_Screen2("Screen 2", Range( 0 , 1)) = 1
		_Screen3("Screen 3", Range( 0 , 1)) = 1
		_ScreenBrightness("Screen Brightness", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[Space(20)]
		[Header(General Properties)]




		[KeywordEnum( Specular_Metallic, Anisotropic_Gloss, Retroreflective )] S ("Specular mode", Float) = 0

		g_flFresnelFalloff ("Fresnel Falloff Scalar" , Range(0.0 , 10.0 ) ) = 1.0
		g_flFresnelExponent( "Fresnel Exponent", Range( 0.5, 10.0 ) ) = 5.0
		[Space(5)]
		[Toggle( _BRDFMAP )] EnableBRDFMAP( "Enable BRDF remap", Int ) = 0
		[NoScaleOffset]g_tBRDFMap("BRDF LUT", 2D) = "grey" {} 
		[Space(10)]
		[Header(Override Properties)]
		g_flCubeMapScalar( "Cube Map Scalar", Range( 0.0, 2.0 ) ) = 1.0
		[Toggle( S_RECEIVE_SHADOWS )] ReceiveShadows( "Receive Shadows", Int ) = 1
		[Toggle( _FLUORESCENCEMAP )] Fluorescence( "Enable Fluorescence", Int ) = 0

		
	}
	
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100
		
		



		Pass
		{
			Name "VRBase"
			Tags { "LightMode"="ForwardBase" "PassFlags"="OnlyDirectional" } // NOTE: "OnlyDirectional" prevents Unity from baking dynamic lights into SH terms at runtime


			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend Off
			ColorMask RGBA
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			
			Cull Back

			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile _ Z_SHAPEAO
			#pragma multi_compile_instancing
			#pragma shader_feature LIGHTPROBE_SH
			#pragma multi_compile _ D_VALVE_FOG
			#pragma skip_variants SHADOWS_SOFT
			#pragma shader_feature	_BRDFMAP
			#pragma shader_feature	S_RECEIVE_SHADOWS
			#pragma shader_feature  _FLUORESCENCEMAP

			#pragma multi_compile	S_SPECULAR_METALLIC S_ANISOTROPIC_GLOSS S_RETROREFLECTIVE	

			#pragma multi_compile	LIGHTMAP_OFF LIGHTMAP_ON
			
			#pragma multi_compile	DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
			#pragma multi_compile	DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON	

			#include "UnityCG.cginc"
			#include "UnityLightingCommon.cginc"
			#include "UnityStandardUtils.cginc"
			#include "UnityGlobalIllumination.cginc"
			#include "vr_utils.cginc"
			#include "vr_lighting.cginc"
			#include "vr_matrix_palette_skinning.cginc"
			#include "vr_fog.cginc"

	

			#include "vr_zAO.cginc"

			float	g_flFresnelExponent;



			#include "UnityShaderVariables.cginc"


			struct appdata //VS INPUT
			{
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 vPositionOs : POSITION;
				float4 vTangentUOs_flTangentVSign : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 texcoord3 : TEXCOORD3;				
				fixed4 color : COLOR;				
			

				// #if ( LIGHTMAP_ON )
				// 	float2 vTexCoord1 : TEXCOORD1;
				// #endif
				// #if ( DYNAMICLIGHTMAP_ON || UNITY_PASS_META )
				// 	float2 vTexCoord2 : TEXCOORD2;
				// #endif
			};
			


			struct v2f //PS INPUT
			{
				float4 vPositionPs : SV_POSITION;
				float3 vPositionWs : TEXCOORD0;
				float3 vNormalWs : NORMAL;
				float3 vTangentUWs : TEXCOORD4;
				float3 vTangentVWs : TEXCOORD5;
				float2 vFogCoords : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;

				#if ( S_OVERRIDE_LIGHTMAP || LIGHTMAP_ON || DYNAMICLIGHTMAP_ON )
					#if ( DYNAMICLIGHTMAP_ON )
						centroid float4 vLightmapUV : TEXCOORD3;
					#else
						centroid float2 vLightmapUV : TEXCOORD3;
					#endif
				#endif
			};

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _Color;
			uniform float _NormalScale;
			uniform sampler2D _BumpMap;
			uniform float4 _BumpMap_ST;
			uniform sampler2D _Masking;
			uniform float4 _Masking_ST;
			uniform float _ScreenTimeGlitch;
			uniform int _PixelCount;
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
			uniform float _Screen1;
			uniform float _Screen2;
			uniform float _Screen3;
			uniform samplerCUBE _CubeBG;
			uniform float3 _Boxscale;
			uniform float3 _Pos;
			uniform float _PlenopticEffect;
			uniform float3 _Pos2;
			uniform float2 _NoiseSize;
			uniform float _NoiseIntensity;
			uniform float _FresnelBlur;
			uniform samplerCUBE _CubeBG2;
			uniform samplerCUBE _CubeBG3;
			uniform float4 _ScreenColor;
			uniform float _ScreenBrightness;
			uniform float _Metallic;
			uniform float _Smoothness;

			//Vertex Shader
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				o.ase_texcoord1.xyz = v.texcoord.xyzw.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;

				float3 vPositionWs = mul( unity_ObjectToWorld, v.vPositionOs.xyzw ).xyz;

				float3 vNormalWs = UnityObjectToWorldNormal( v.normal.xyz );
				o.vNormalWs.xyz = vNormalWs.xyz;

				float3 vTangentUWs = UnityObjectToWorldDir( v.vTangentUOs_flTangentVSign.xyz ); // Transform tangentU into world space
				//vTangentUWs.xyz = normalize( vTangentUWs.xyz - ( vNormalWs.xyz * dot( vTangentUWs.xyz, vNormalWs.xyz ) ) ); // Force tangentU perpendicular to normal and normalize

				o.vTangentUWs.xyz = vTangentUWs.xyz;
				o.vTangentVWs.xyz = cross( vNormalWs.xyz, vTangentUWs.xyz ) * v.vTangentUOs_flTangentVSign.w;

				vPositionWs.xyz +=  float3(0,0,0) ;

				//v.vPositionPs = UnityObjectToClipPos(v.vPositionWs);
				o.vPositionPs.xyzw = UnityObjectToClipPos( v.vPositionOs.xyzw );
				o.vPositionWs = vPositionWs;

				#if ( LIGHTMAP_ON )
				{
					// Static lightmaps
					o.vLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				#endif

				#if ( DYNAMICLIGHTMAP_ON )
				{
					o.vLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}
				#endif

				#if ( D_VALVE_FOG )				
					o.vFogCoords.xy = CalculateFogCoords( vPositionWs.xyz );				
				#endif


				return o;
			}


			/////////////////


			//Pixel Shader
			fixed4 frag (v2f i , bool bIsFrontFace : SV_IsFrontFace) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				fixed4 finalColor = float4(0,0,0,0);
				float2 uv_MainTex = i.ase_texcoord1.xyz * _MainTex_ST.xy + _MainTex_ST.zw;
				
				float2 uv_BumpMap = i.ase_texcoord1.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float3 tex2DNode13 = UnpackScaleNormal( tex2D( _BumpMap, uv_BumpMap ), _NormalScale );
				
				float2 uv0_Masking = i.ase_texcoord1.xyz.xy * _Masking_ST.xy + _Masking_ST.zw;
				float mulTime139 = _Time.y * _ScreenTimeGlitch;
				float2 uv0_EmissionMask = i.ase_texcoord1.xyz.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				float4 temp_cast_1 = (0.5).xxxx;
				float4 appendResult215 = (float4(_Screen1 , _Screen2 , _Screen3 , 0.0));
				float4 break133 = ( frac( ( ( tex2D( _Masking, ( uv0_Masking + ( ceil( mulTime139 ) / _PixelCount ) ) ) + ( ( tex2D( _Masking, uv0_EmissionMask ) - temp_cast_1 ) * 0.1 ) ) + mulTime139 ) ) * appendResult215 );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(i.vPositionWs.xyz);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 temp_output_180_0 = ( _PlenopticEffect * frac( ( i.vPositionWs.xyz * float3( 2,2,2 ) ) ) );
				float3 break77 = ( (  ( -ase_worldViewDir - 0.0 > 0.0 ? ( _Boxscale + _Pos + temp_output_180_0 ) : -ase_worldViewDir - 0.0 <= 0.0 && -ase_worldViewDir + 0.0 >= 0.0 ? 0.0 : ( -_Boxscale + _Pos2 + temp_output_180_0 ) )  - i.vPositionWs.xyz ) / -ase_worldViewDir );
				float2 temp_output_190_0 = frac( ( uv0_EmissionMask * _NoiseSize ) );
				float dotResult188 = dot( temp_output_190_0 , ( temp_output_190_0 + float2( 3.35,43.8 ) ) );
				float2 break193 = ( temp_output_190_0 + dotResult188 );
				float3 temp_output_80_0 = ( ( -ase_worldViewDir * min( min( break77.x , break77.y ) , break77.z ) ) + ( ( i.vPositionWs.xyz - _Pos ) + temp_output_180_0 + ( frac( ( break193.x * break193.y ) ) * _NoiseIntensity ) ) );
				float3 tanToWorld0 = float3( float3(i.vTangentUWs.xy,0).x, i.vTangentVWs.xyz.x, i.vNormalWs.xyz.x );
				float3 tanToWorld1 = float3( float3(i.vTangentUWs.xy,0).y, i.vTangentVWs.xyz.y, i.vNormalWs.xyz.y );
				float3 tanToWorld2 = float3( float3(i.vTangentUWs.xy,0).z, i.vTangentVWs.xyz.z, i.vNormalWs.xyz.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 normalizeResult21 = normalize( ase_tanViewDir );
				float dotResult20 = dot( tex2DNode13 , normalizeResult21 );
				float temp_output_42_0 = ( ( 1.0 - dotResult20 ) * _FresnelBlur );
				float4 texCUBENode4 = texCUBElod( _CubeBG, float4( temp_output_80_0, temp_output_42_0) );
				float4 texCUBENode113 = texCUBElod( _CubeBG2, float4( temp_output_80_0, temp_output_42_0) );
				float4 ifLocalVar136 = 0;
				if( break133.r >= break133.g )
				ifLocalVar136 = texCUBENode4;
				else
				ifLocalVar136 = texCUBENode113;
				float4 texCUBENode114 = texCUBElod( _CubeBG3, float4( temp_output_80_0, temp_output_42_0) );
				float4 ifLocalVar137 = 0;
				if( break133.g >= break133.b )
				ifLocalVar137 = ifLocalVar136;
				else
				ifLocalVar137 = texCUBENode114;
				float2 uv_EmissionMask = i.ase_texcoord1.xyz.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				
				float3 temp_cast_4 = (_Metallic).xxx;
				


				float3 vTangentUWs = float3( 1.0, 0.0, 0.0 );
				float3 vTangentVWs = float3( 0.0, 1.0, 0.0 );

				vTangentUWs.xyz = i.vTangentUWs.xyz;
				vTangentVWs.xyz = i.vTangentVWs.xyz;
				
				float3 vGeometricNormalWs = float3( 0.0, 0.0, 1.0 );		
				i.vNormalWs.xyz *= ( bIsFrontFace ? 1.0 : -1.0 ); // Flip backfacking normals
				i.vNormalWs.xyz = normalize( i.vNormalWs.xyz );
				vGeometricNormalWs.xyz = i.vNormalWs.xyz;

				float3 vNormalWs = vGeometricNormalWs.xyz;

			//	float3 vNormalTs = float3( 0.0, 0.0, 1.0 );		

				
				//Specular components
				float3 vSpecColor;
				float flOneMinusReflectivity;

				LightingTerms_t lightingTerms;
				lightingTerms.vDiffuse.rgba = float4( 1.0, 1.0, 1.0 ,1.0);
				lightingTerms.vSpecular.rgb = float3( 0.0, 0.0, 0.0 );
				lightingTerms.vIndirectDiffuse.rgb = float3( 0.0, 0.0, 0.0 );
				lightingTerms.vIndirectSpecular.rgb = float3( 0.0, 0.0, 0.0 );
				lightingTerms.vTransmissiveSunlight.rgb = float3( 0.0, 0.0, 0.0 );


				float3 Albedo = ( tex2D( _MainTex, uv_MainTex ) * _Color ).rgb;
				float3 Normal = tex2DNode13;  //vNormalTs
				float3 Emission = ( ( ifLocalVar137 * _ScreenColor * dotResult20 ) * tex2D( _EmissionMask, uv_EmissionMask ) * _ScreenBrightness ).rgb;
				float Metallic = temp_cast_4;
				float Roughness = 1 - saturate( _Smoothness );
				float Retroreflective = 0;
				float AnisotropicDirection = 0;
				float AnisotropicRatio = 1;
				float DiffuseOcclusion = 1;
				float SpecularOcclusion = 1;
				float Alpha = 1;
				float Cutoff = 1;
				float3 Fluorescence = fixed3(0,0,0);
				float4 Absorbance = fixed4(0,0.5,0.75,0.9);
 		

				//Added a shader graph function instead
				//#if ( _ALPHATEST_ON )
				//Magic AlphaToCoverage sharpening. Thanks Ben Golus! https://medium.com/@bgolus/anti-aliased-alpha-test-the-esoteric-alpha-to-coverage-8b177335ae4f
				//Alpha = (Alpha - Cutoff) / max(fwidth(Alpha), 0.0001) + 0.5;
				//#endif 



				// #if ( S_ANISOTROPIC_GLOSS  )
				// {
				// 	//x = Metallic, y = Gloss, z = Rotation, w = Ratio
				// 	float4 vMetallicGloss;// = MetallicGloss( i.vTextureCoords.xy );
				// 		vMetallicGloss.z = frac(vMetallicGloss.z + _AnisotropicRotation);
				// 	#else
				// 		vMetallicGloss.xyzw = half4(_Metallic, _Glossiness, _AnisotropicRotation, _AnisotropicRatio);
				// 	#endif
	
				// 	flGloss.xyz = vMetallicGloss.yzw;
				// }

				// #elif ( S_RETROREFLECTIVE )
				// {
				// 	float normalBlend = saturate( Dotfresnel );
				// 	normalBlend = pow (normalBlend , 0.25);

				// 	float2 vMetallicGloss;// = MetallicGloss( i.vTextureCoords.xy );
				// 	#ifdef _METALLICGLOSSMAP
				// 		vMetallicGloss.xy = tex2D(_MetallicGlossMap, zTextureCoords.xy).ra;
				// 	#else
				// 		vMetallicGloss.xy = half2(_Metallic, _Glossiness);
				// 	#endif
		
				// 	flGloss.x = vMetallicGloss.y ;//* normalBlend;
				
				// }



					

				float4 vLightmapUV = float4( 0.0, 0.0, 0.0, 0.0 );
				#if ( S_OVERRIDE_LIGHTMAP || LIGHTMAP_ON || DYNAMICLIGHTMAP_ON )
				{
					vLightmapUV.xy = i.vLightmapUV.xy;
					#if ( DYNAMICLIGHTMAP_ON )
					{
						vLightmapUV.zw = i.vLightmapUV.zw;
					}
					#endif
				}
				#endif

				#if (S_RETROREFLECTIVE)
				float3 specularinfo = float3(Roughness,Retroreflective,Retroreflective);
				#elif (S_ANISOTROPIC_GLOSS)
				float3 specularinfo = float3(Roughness,AnisotropicDirection,AnisotropicRatio);
				#else 
				float3 specularinfo = Roughness;
				#endif

				//Normal falloff Roughness
				Roughness = AdjustRoughnessByGeometricNormal( Roughness, vGeometricNormalWs.xyz );

				Albedo = DiffuseAndSpecularFromMetallic( Albedo.rgb, Metallic, vSpecColor, flOneMinusReflectivity);
				vNormalWs.xyz = Vec3TsToWsNormalized( Normal.xyz, vGeometricNormalWs.xyz, vTangentUWs.xyz, vTangentVWs.xyz  ); //Add tanget normal to world normal
				float ndotv = saturate(dot( vNormalWs.xyz , CalculatePositionToCameraDirWs( i.vPositionWs.xyz ) ));	//base Fresnel falloff
				
				lightingTerms = ComputeLighting( i.vPositionWs, vNormalWs, vTangentUWs.xyz, vTangentVWs, specularinfo, vSpecColor, g_flFresnelExponent, vLightmapUV.xyzw, ndotv );
		//		lightingTerms = ComputeLighting( i.vPositionWs.xyz, vNormalWs.xyz, vTangentUWs.xyz, vTangentVWs.xyz, vRoughness.xyz, vReflectance.rgb, g_flFresnelExponent, vLightmapUV.xyzw, Dotfresnel );
				finalColor.rgb = (lightingTerms.vDiffuse.rgb + lightingTerms.vIndirectDiffuse.rgb) * Albedo * DiffuseOcclusion;
				finalColor.rgb += (lightingTerms.vSpecular.rgb + lightingTerms.vIndirectSpecular.rgb) * SpecularOcclusion;

				
				#if ( _FLUORESCENCEMAP )			

					float4 FluorescenceAbsorb = (lightingTerms.vDiffuse + float4( lightingTerms.vIndirectDiffuse.rgb , 0.0 ) ) * Absorbance;					

					float Absorbed_B = FluorescenceAbsorb.b + FluorescenceAbsorb.a;
					float Absorbed_G = Absorbed_B + FluorescenceAbsorb.g;
					float Absorbed_R = Absorbed_G + FluorescenceAbsorb.r;

					float3 LitFluorescence =  float3(Absorbed_R, Absorbed_G, Absorbed_B) * Fluorescence.rgb ;
					finalColor.rgb = max(finalColor.rgb, LitFluorescence.rgb);					

				#endif

			#ifdef Z_SHAPEAO 					
				float vAO = CalculateShapeAO( i.vPositionWs.xyz, vNormalWs);
				finalColor.rgb *= vAO;			
			#endif

				finalColor.rgb += Emission;

			#if ( D_VALVE_FOG )
					// #if (_ALPHAPREMULTIPLY_ON || _ALPHAMULTIPLY_ON || _ALPHAMOD2X_ON)
					// o.vColor.rgba = ApplyFog( o.vColor.rgba, i.vFogCoords.xy, _FogMultiplier, _ColorMultiplier );
					// #else
					finalColor.rgb = ApplyFog( finalColor.rgb, i.vFogCoords.xy, 1 );
					//#endif
			#endif

			finalColor.rgb += ScreenSpaceDither( i.vPositionPs.xy );

			finalColor.a = Alpha;

			// #if S_SPECULAR_BLINNPHONG
			// finalColor *= float4(0,1,0,1);
			// #endif
			
				// #if _BRDFMAP

				// finalColor = float4(1,0,0,1);
				// #endif

				return finalColor;
			}
			ENDCG
		}

				Pass
		{
			Name "META" 
			Tags { "LightMode"="Meta" }
		
			Cull Off
			CGPROGRAM
				/*ase_pragma_before*/
				#pragma only_renderers d3d11

				#pragma vertex vert_meta
				#pragma fragment frag_meta
		
				#pragma shader_feature _EMISSION
				#pragma shader_feature _METALLICGLOSSMAP
				#pragma shader_feature ___ _DETAIL_MULX2
		
				#include "UnityStandardMeta.cginc"
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16900
7;7;1906;1044;64.15186;111.4103;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;194;-5184.449,802.4651;Float;False;1793.931;373.874;Comment;11;184;187;185;190;188;189;193;192;191;196;198;Random;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;71;-3356.73,386.2442;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;184;-5134.449,873.3656;Float;False;0;35;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;196;-5143.463,1099.605;Float;False;Property;_NoiseSize;Noise Size;22;0;Create;True;0;0;False;0;0.01,3;0,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;-3074.677,536.0643;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;182;-3152.993,744.6332;Float;False;Property;_PlenopticEffect;Plenoptic Effect;20;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;73;-3300.625,777.4765;Float;False;Property;_Boxscale;Box scale;17;0;Create;True;0;0;False;0;0,0,0;200,200,200;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FractNode;179;-2953.677,570.0643;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;6;-3795.481,-283.0136;Float;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;185;-4769.381,863.3613;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;234.34,435.345;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-4215.599,1336.976;Float;False;Property;_ScreenTimeGlitch;Screen Time Glitch;18;0;Create;True;0;0;False;0;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;190;-4608.264,879.8256;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector3Node;72;-3073.384,1062.442;Float;False;Property;_Pos;Pos;15;0;Create;True;0;0;False;0;0,0,0;0,233.9,75.25;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;104;-3070.449,1255.855;Float;False;Property;_Pos2;Pos2;16;0;Create;True;0;0;False;0;0,0,0;0,200,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;139;-3990.614,1352.532;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;180;-2847.677,678.0643;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;50,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;84;-2757.575,946.9216;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;7;-3525.523,-268.1664;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;199;-3579.444,1537.009;Float;True;Property;_Masking;Masking;23;1;[Gamma];Create;True;0;0;False;0;None;d5ade9d596e27c142ac6fe11f3b4d68e;False;gray;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.IntNode;165;-3913.009,2067.874;Float;False;Property;_PixelCount;PixelCount;19;0;Create;True;0;0;False;0;128;128;0;1;INT;0
Node;AmplifyShaderEditor.CeilOpNode;173;-3851.905,1839.749;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;202;-4237.108,2301.102;Float;False;0;35;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;189;-4591.799,1002.134;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;3.35,43.8;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-2713.506,1168.843;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;102;-2306.436,416.4436;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;-2845.367,806.2659;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-3566.238,2463.635;Float;False;Constant;_Float2;Float 2;25;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;188;-4424.801,980.9653;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;201;-3949.929,2285.638;Float;True;Property;_TextureSample1;Texture Sample 1;18;1;[Gamma];Create;True;0;0;False;0;0714b71b5492ff24d9397b4e2567c22b;d5ade9d596e27c142ac6fe11f3b4d68e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;174;-3599.339,1977.235;Float;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;166;-3634.984,1772.534;Float;False;0;199;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCIf;83;-2534.372,688.8364;Float;False;6;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;208;-3298.312,2480.422;Float;False;Constant;_Float3;Float 3;25;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;205;-3359.887,2366.114;Float;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;187;-4288.38,923.3391;Float;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;74;-2229.187,567.8656;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;164;-3427.226,1895.762;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;207;-3135.163,2378.834;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;193;-4100.215,905.6985;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleDivideOpNode;75;-1994.823,505.3764;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;122;-3386.081,2079.894;Float;True;Property;_Mask;Mask;18;1;[Gamma];Create;True;0;0;False;0;0714b71b5492ff24d9397b4e2567c22b;d5ade9d596e27c142ac6fe11f3b4d68e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;14;-3368.622,-587.332;Float;False;Property;_NormalScale;NormalScale;8;0;Create;True;0;0;False;0;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;22;-3413.815,-438.7008;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;203;-2943.736,1917.047;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-3827.374,897.4663;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;77;-1820.928,691.347;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.FractNode;191;-3588.518,852.4651;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;140;-2707.169,1647.964;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;198;-3637.657,1107.63;Float;False;Property;_NoiseIntensity;Noise Intensity;21;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;76;-1532.128,676.9474;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;13;-3153.333,-634.7465;Float;True;Property;_BumpMap;BumpMap;7;0;Create;True;0;0;False;0;None;b7090b2e6e84a074386ba1a0caad9c17;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalizeNode;21;-3171.815,-434.7008;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FractNode;142;-2313.337,1616.484;Float;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;81;-1684.628,1044.993;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;20;-2840.596,-459.1613;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;197;-3412.256,968.3297;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;211;-1399.203,1990.908;Float;False;Property;_Screen1;Screen 1;25;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;213;-1400.056,2139.112;Float;False;Property;_Screen3;Screen 3;27;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-1400.056,2063.112;Float;False;Property;_Screen2;Screen 2;26;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;78;-1392.728,702.3478;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;215;-1001.056,1860.112;Float;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.OneMinusNode;41;-2574.462,-321.2434;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2664.302,-108.1178;Float;False;Property;_FresnelBlur;FresnelBlur;13;0;Create;True;0;0;False;0;0;2.5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1273.528,549.9465;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;181;-1418.75,1082.196;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;130;-1417.496,1474.549;Float;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-2331.791,-408.7857;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-1081.285,534.7302;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;-1086.843,1605.836;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;4;-792.6559,424.5109;Float;True;Property;_CubeBG;CubeBG;4;1;[NoScaleOffset];Create;True;0;0;False;0;None;4b2913ade06f2294087cd98ccc40a5a0;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;113;-786.0207,621.2432;Float;True;Property;_CubeBG2;CubeBG2;3;1;[NoScaleOffset];Create;True;0;0;False;0;None;caf948dfb5d85b041a452b1d547f9879;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;133;-700.6332,1413.566;Float;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;114;-790.6547,829.1776;Float;True;Property;_CubeBG3;CubeBG3;1;1;[NoScaleOffset];Create;True;0;0;False;0;None;0c88c33e63cbf4b68bf076b23b817041;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ConditionalIfNode;136;-38.06564,1009.92;Float;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;137;136.1842,1143.649;Float;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;11;66.17983,-102.1887;Float;False;Property;_ScreenColor;ScreenColor;6;1;[HDR];Create;True;0;0;False;0;1,1,1,1;2,2,2,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RelayNode;125;105.0194,300.4883;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;214;124.8558,2052.639;Float;False;Property;_ScreenBrightness;Screen Brightness;28;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;484.6667,-488.1103;Float;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;35;507.5051,314.323;Float;True;Property;_EmissionMask;Emission Mask;9;0;Create;True;0;0;False;0;None;f2921badc6af035408a8198aa553c51e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;324.0798,242.0705;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;9;585.6666,-659.1102;Float;False;Property;_Color;Color;5;0;Create;True;0;0;False;0;0,0,0,0;0.2516457,0.2735841,0.2708814,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;58;-3858.495,129.9314;Float;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;959.8515,57.64354;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;55;-3464.195,50.03834;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;54;-3304.195,78.03832;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;109;-3316.039,-234.9975;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.WorldNormalVector;62;-2900.121,-92.15472;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;861.6665,-464.1104;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;38;734.4625,-74.92045;Float;False;Property;_Smoothness;Smoothness;11;0;Create;True;0;0;False;0;0;0.916;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;183;-3197.302,1693.961;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-307.3748,784.4492;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;112;913.0074,360.2009;Float;False;Global;globalScreenScaler;globalScreenScaler;15;0;Create;True;0;0;False;0;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-296.4762,1003.305;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;138;439.1228,952.888;Float;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;45;860.9147,504.0828;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-3923.679,49.1406;Float;False;Property;_Rotation;Rotation;14;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;57;-3136.195,237.0384;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;111;720.1395,-159.1449;Float;False;Property;_Metallic;Metallic;12;0;Create;True;0;0;False;0;0;0.977;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;117;-287.1291,428.8633;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;116;-90.17991,695.1025;Float;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;56;-2743.586,268.7626;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;115;-799.0807,1039.227;Float;True;Property;_CubeBG4;CubeBG4;2;1;[NoScaleOffset];Create;True;0;0;False;0;None;46d5874372228443fa0640e1bebd08aa;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-3606.944,103.7697;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;44;513.6088,499.1119;Float;True;Property;_EmissionMask2;EmissionMask2;10;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;118;-283.401,575.5081;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;209;-1356.843,1722.836;Float;False;Property;_ScreenBias;ScreenBias;24;0;Create;True;0;0;False;0;1,1,1,1;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;200;-1538.454,1232.342;Float;True;Property;_TextureSample0;Texture Sample 0;18;1;[Gamma];Create;True;0;0;False;0;0714b71b5492ff24d9397b4e2567c22b;d5ade9d596e27c142ac6fe11f3b4d68e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;110;1242.434,-229.115;Float;False;True;2;Float;ASEMaterialInspector;0;11;SLZ/Holographic Wall Glitchy;1f6ac94e27bd0934ab97faa6217ad58e;True;VRBase;0;0;VRBase;15;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;0;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;LightMode=ForwardBase;PassFlags=OnlyDirectional;True;2;0;;0;0;Standard;0;0;1;True;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT3;0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT3;0,0,0;False;0
WireConnection;178;0;71;0
WireConnection;179;0;178;0
WireConnection;185;0;184;0
WireConnection;185;1;196;0
WireConnection;190;0;185;0
WireConnection;139;0;141;0
WireConnection;180;0;182;0
WireConnection;180;1;179;0
WireConnection;84;0;73;0
WireConnection;7;0;6;0
WireConnection;173;0;139;0
WireConnection;189;0;190;0
WireConnection;108;0;84;0
WireConnection;108;1;104;0
WireConnection;108;2;180;0
WireConnection;102;0;7;0
WireConnection;103;0;73;0
WireConnection;103;1;72;0
WireConnection;103;2;180;0
WireConnection;188;0;190;0
WireConnection;188;1;189;0
WireConnection;201;0;199;0
WireConnection;201;1;202;0
WireConnection;174;0;173;0
WireConnection;174;1;165;0
WireConnection;83;0;102;0
WireConnection;83;2;103;0
WireConnection;83;4;108;0
WireConnection;205;0;201;0
WireConnection;205;1;206;0
WireConnection;187;0;190;0
WireConnection;187;1;188;0
WireConnection;74;0;83;0
WireConnection;74;1;71;0
WireConnection;164;0;166;0
WireConnection;164;1;174;0
WireConnection;207;0;205;0
WireConnection;207;1;208;0
WireConnection;193;0;187;0
WireConnection;75;0;74;0
WireConnection;75;1;102;0
WireConnection;122;0;199;0
WireConnection;122;1;164;0
WireConnection;203;0;122;0
WireConnection;203;1;207;0
WireConnection;192;0;193;0
WireConnection;192;1;193;1
WireConnection;77;0;75;0
WireConnection;191;0;192;0
WireConnection;140;0;203;0
WireConnection;140;1;139;0
WireConnection;76;0;77;0
WireConnection;76;1;77;1
WireConnection;13;5;14;0
WireConnection;21;0;22;0
WireConnection;142;0;140;0
WireConnection;81;0;71;0
WireConnection;81;1;72;0
WireConnection;20;0;13;0
WireConnection;20;1;21;0
WireConnection;197;0;191;0
WireConnection;197;1;198;0
WireConnection;78;0;76;0
WireConnection;78;1;77;2
WireConnection;215;0;211;0
WireConnection;215;1;212;0
WireConnection;215;2;213;0
WireConnection;41;0;20;0
WireConnection;79;0;102;0
WireConnection;79;1;78;0
WireConnection;181;0;81;0
WireConnection;181;1;180;0
WireConnection;181;2;197;0
WireConnection;130;0;142;0
WireConnection;42;0;41;0
WireConnection;42;1;39;0
WireConnection;80;0;79;0
WireConnection;80;1;181;0
WireConnection;210;0;130;0
WireConnection;210;1;215;0
WireConnection;4;1;80;0
WireConnection;4;2;42;0
WireConnection;113;1;80;0
WireConnection;113;2;42;0
WireConnection;133;0;210;0
WireConnection;114;1;80;0
WireConnection;114;2;42;0
WireConnection;136;0;133;0
WireConnection;136;1;133;1
WireConnection;136;2;4;0
WireConnection;136;3;4;0
WireConnection;136;4;113;0
WireConnection;137;0;133;1
WireConnection;137;1;133;2
WireConnection;137;2;136;0
WireConnection;137;3;136;0
WireConnection;137;4;114;0
WireConnection;125;0;137;0
WireConnection;12;0;125;0
WireConnection;12;1;11;0
WireConnection;12;2;20;0
WireConnection;36;0;12;0
WireConnection;36;1;35;0
WireConnection;36;2;214;0
WireConnection;55;0;109;0
WireConnection;55;1;109;2
WireConnection;54;0;55;0
WireConnection;54;2;59;0
WireConnection;109;0;7;0
WireConnection;8;0;3;0
WireConnection;8;1;9;0
WireConnection;119;0;114;0
WireConnection;119;1;133;2
WireConnection;120;0;115;0
WireConnection;120;1;133;3
WireConnection;138;0;133;2
WireConnection;138;1;133;3
WireConnection;138;2;137;0
WireConnection;138;3;137;0
WireConnection;138;4;115;0
WireConnection;45;0;44;0
WireConnection;57;0;54;0
WireConnection;117;0;4;0
WireConnection;117;1;133;0
WireConnection;116;0;117;0
WireConnection;116;1;118;0
WireConnection;116;2;119;0
WireConnection;116;3;120;0
WireConnection;56;0;57;0
WireConnection;56;1;109;1
WireConnection;56;2;57;1
WireConnection;115;1;80;0
WireConnection;115;2;42;0
WireConnection;59;0;51;0
WireConnection;59;1;58;0
WireConnection;118;0;113;0
WireConnection;118;1;133;1
WireConnection;200;0;199;0
WireConnection;200;1;184;0
WireConnection;110;0;8;0
WireConnection;110;1;13;0
WireConnection;110;2;36;0
WireConnection;110;3;111;0
WireConnection;110;4;38;0
ASEEND*/
//CHKSM=7231F0BC3C23E55FB93FCB80C919234F341194F0