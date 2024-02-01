// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Holographic Wall 2 Layer"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_CubeFGAlpha("CubeFG Alpha", CUBE) = "black" {}
		_CubeFG("CubeFG", CUBE) = "black" {}
		_CubeBG("CubeBG", CUBE) = "black" {}
		_Color("Color", Color) = (0,0,0,0)
		[HDR]_EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HDR]_BakedEmission("Baked Emission Color", Color) = (1,1,1,1)
		_BumpMap("BumpMap", 2D) = "bump" {}
		_NormalScale("NormalScale", Float) = 1
		_EmissionMask("Emission Mask", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_FresnelBlur("FresnelBlur", Range( 0 , 10)) = 0
		_Pos("Pos", Vector) = (0,0,0,0)
		_Pos2("Pos2", Vector) = (0,0,0,0)
		_Vector0("Vector 0", Vector) = (0,0,0,0)
		_Vector1("Vector 1", Vector) = (0,0,0,0)
		_Vector2("Vector 2", Vector) = (0,0,0,0)
		_Boxscale("Box scale", Vector) = (0,0,0,0)
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
			uniform samplerCUBE _CubeBG;
			uniform float3 _Boxscale;
			uniform float3 _Pos;
			uniform float3 _Pos2;
			uniform float _FresnelBlur;
			uniform samplerCUBE _CubeFG;
			uniform float3 _Vector0;
			uniform float3 _Vector2;
			uniform float3 _Vector1;
			uniform samplerCUBE _CubeFGAlpha;
			uniform float4 _EmissionColor;
			uniform sampler2D _EmissionMask;
			uniform float4 _EmissionMask_ST;
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
				
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(i.vPositionWs.xyz);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 break77 = ( (  ( -ase_worldViewDir - 0.0 > 0.0 ? ( _Boxscale + _Pos ) : -ase_worldViewDir - 0.0 <= 0.0 && -ase_worldViewDir + 0.0 >= 0.0 ? 0.0 : ( -_Boxscale + _Pos2 ) )  - i.vPositionWs.xyz ) / -ase_worldViewDir );
				float3 tanToWorld0 = float3( float3(i.vTangentUWs.xy,0).x, i.vTangentVWs.xyz.x, i.vNormalWs.xyz.x );
				float3 tanToWorld1 = float3( float3(i.vTangentUWs.xy,0).y, i.vTangentVWs.xyz.y, i.vNormalWs.xyz.y );
				float3 tanToWorld2 = float3( float3(i.vTangentUWs.xy,0).z, i.vTangentVWs.xyz.z, i.vNormalWs.xyz.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 normalizeResult21 = normalize( ase_tanViewDir );
				float dotResult20 = dot( tex2DNode13 , normalizeResult21 );
				float CubeFalloff138 = ( ( 1.0 - dotResult20 ) * _FresnelBlur );
				float3 break129 = ( (  ( -ase_worldViewDir - 0.0 > 0.0 ? ( _Vector0 + _Vector2 ) : -ase_worldViewDir - 0.0 <= 0.0 && -ase_worldViewDir + 0.0 >= 0.0 ? 0.0 : ( -_Vector0 + _Vector1 ) )  - i.vPositionWs.xyz ) / -ase_worldViewDir );
				float3 temp_output_133_0 = ( ( -ase_worldViewDir * min( min( break129.x , break129.y ) , break129.z ) ) + ( i.vPositionWs.xyz - _Vector2 ) );
				float smoothstepResult143 = smoothstep( 0.2 , 0.7 , texCUBElod( _CubeFGAlpha, float4( temp_output_133_0, CubeFalloff138) ).r);
				float4 lerpResult136 = lerp( texCUBElod( _CubeBG, float4( ( ( -ase_worldViewDir * min( min( break77.x , break77.y ) , break77.z ) ) + ( i.vPositionWs.xyz - _Pos ) ), CubeFalloff138) ) , texCUBElod( _CubeFG, float4( temp_output_133_0, CubeFalloff138) ) , smoothstepResult143);
				float2 uv_EmissionMask = i.ase_texcoord1.xyz.xy * _EmissionMask_ST.xy + _EmissionMask_ST.zw;
				
				float3 temp_cast_2 = (_Metallic).xxx;
				


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
				float3 Emission = ( ( lerpResult136 * _EmissionColor * dotResult20 ) * tex2D( _EmissionMask, uv_EmissionMask ) ).rgb;
				float Metallic = temp_cast_2;
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
				#pragma only_renderers d3d11

				#pragma vertex vert_meta
				#pragma fragment frag_meta
		
				#pragma shader_feature _EMISSION
				#pragma shader_feature _METALLICGLOSSMAP
				#pragma shader_feature ___ _DETAIL_MULX2
		
				#include "UnityStandardMeta.cginc"
			ENDCG
		}
		
 
		Pass
		{
			Name "META2"
			Tags {"LightMode"="Meta"}
			Cull Off
			CGPROGRAM
					
			#include "UnityStandardMeta.cginc"
			#pragma vertex vert_meta
			#pragma fragment frag_meta_custom

			uniform float4 _BakedEmission;
		
			fixed4 frag_meta_custom (v2f_meta  i) : SV_Target
			{
				// Colors              
				fixed4 col = _BakedEmission; // The emission color
		
				// Calculate emission
				UnityMetaInput metaIN;
				UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
				metaIN.Albedo = col.rgb;
				metaIN.Emission = col.rgb;
				return UnityMetaFragment(metaIN);
		
				return col;
			}
		
			ENDCG
		}
 
		
		
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16600
7;110;1417;844;1439.418;39.55637;1.592305;True;True
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;6;-3645.896,82.90406;Float;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;115;-3340.023,1655.942;Float;False;2423.924;1073.411;Comment;20;133;132;131;130;129;128;127;126;125;124;123;122;121;120;119;118;117;116;140;137;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NegateNode;7;-3375.938,97.75127;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;113;-3168.625,366.4436;Float;False;2423.924;1073.411;Comment;19;4;73;104;84;72;102;108;103;83;71;74;75;81;77;76;78;79;80;139;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;134;-3430.814,1463.682;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;117;-3290.023,2063.075;Float;False;Property;_Vector0;Vector 0;15;0;Create;True;0;0;False;0;0,0,0;29,29,58.3;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;120;-3244.782,2351.941;Float;False;Property;_Vector2;Vector 2;17;0;Create;True;0;0;False;0;0,0,0;4.71,6.77,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;135;-2562.92,1585.618;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;73;-3118.625,773.5765;Float;False;Property;_Boxscale;Box scale;18;0;Create;True;0;0;False;0;0,0,0;54.1,50,50;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;119;-2928.973,2236.42;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;118;-3241.847,2545.354;Float;False;Property;_Vector1;Vector 1;16;0;Create;True;0;0;False;0;0,0,0;-1.23,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;123;-3016.765,2095.765;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;122;-2884.904,2458.342;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;121;-2477.834,1705.942;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;72;-3073.384,1062.442;Float;False;Property;_Pos;Pos;13;0;Create;True;0;0;False;0;0,0,0;3.78,10.94,29.01;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;104;-3070.449,1255.855;Float;False;Property;_Pos2;Pos2;14;0;Create;True;0;0;False;0;0,0,0;0,50,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;84;-2757.575,946.9216;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;-2845.367,806.2659;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;102;-2306.436,416.4436;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;125;-3112.128,1809.743;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCIf;124;-2705.77,1978.335;Float;False;6;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-2713.506,1168.843;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;126;-2400.585,1857.364;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-3368.622,-587.332;Float;False;Property;_NormalScale;NormalScale;7;0;Create;True;0;0;False;0;1;0.32;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;22;-3411.688,-438.7008;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCIf;83;-2534.372,688.8364;Float;False;6;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;71;-2940.73,520.2442;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;74;-2229.187,567.8656;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;127;-2166.221,1794.875;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;13;-3153.333,-634.7465;Float;True;Property;_BumpMap;BumpMap;6;0;Create;True;0;0;False;0;None;b7090b2e6e84a074386ba1a0caad9c17;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NormalizeNode;21;-3171.815,-434.7008;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;75;-1994.823,505.3764;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;129;-2097.326,2067.846;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DotProductOpNode;20;-2840.596,-459.1613;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;130;-1818.526,1950.446;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;41;-2574.462,-321.2434;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2664.302,-108.1178;Float;False;Property;_FresnelBlur;FresnelBlur;12;0;Create;True;0;0;False;0;0;1.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;77;-1925.928,778.347;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMinOpNode;76;-1647.128,660.9474;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;131;-1677.126,2041.847;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-2331.791,-408.7857;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;78;-1505.728,752.3478;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;138;-1992.823,-361.4124;Float;False;CubeFalloff;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;128;-1856.026,2334.492;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-1565.926,1897.445;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;81;-1684.628,1044.993;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1394.528,607.9465;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;140;-1566.8,1766.191;Float;False;138;CubeFalloff;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;133;-1440.878,2006.974;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;139;-1323.54,460.0745;Float;False;138;CubeFalloff;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;137;-1225.592,1953.315;Float;True;Property;_CubeFGAlpha;CubeFG Alpha;1;0;Create;True;0;0;False;0;None;ff07cf709f8987149b6b6940eefb88eb;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-1269.48,717.4756;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;143;-790.3287,1834.92;Float;True;3;0;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;116;-1248.099,1738.159;Float;True;Property;_CubeFG;CubeFG;2;0;Create;True;0;0;False;0;None;e28e448f42f833b4cb7053f5e2e9375e;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1076.701,448.6599;Float;True;Property;_CubeBG;CubeBG;3;0;Create;True;0;0;False;0;None;1ecd4325d583dc640bb7f33def734441;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;11;-563.9006,356.8009;Float;False;Property;_EmissionColor;Emission Color;5;1;[HDR];Create;True;0;0;False;0;1,1,1,1;2.851329,3.09434,3.029537,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;136;-586.3539,820.3658;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-194.861,277.2519;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;35;-230.9206,447.4391;Float;True;Property;_EmissionMask;Emission Mask;8;0;Create;True;0;0;False;0;None;03ad506bc40f22747a5f991faf00f9d8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;9;-147.0273,-476.3199;Float;False;Property;_Color;Color;4;0;Create;True;0;0;False;0;0,0,0,0;0.2452828,0.1846339,0.06132061,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-248.0273,-305.3199;Float;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;38;1.7686,107.8699;Float;False;Property;_Smoothness;Smoothness;10;0;Create;True;0;0;False;0;0;0.679;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;45;128.2208,686.8731;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;128.9726,-281.32;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-12.5544,23.64542;Float;False;Property;_Metallic;Metallic;11;0;Create;True;0;0;False;0;0;0.764;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;227.1576,240.4339;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;44;-279.98,686.8731;Float;True;Property;_EmissionMask2;EmissionMask2;9;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;112;118.1761,555.4186;Float;False;Global;globalScreenScaler;globalScreenScaler;15;0;Create;True;0;0;False;0;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;110;509.7402,-46.32463;Float;False;True;2;Float;ASEMaterialInspector;0;11;SLZ/Holographic Wall 2 Layer;1f6ac94e27bd0934ab97faa6217ad58e;True;VRBase;0;0;VRBase;15;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;0;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;LightMode=ForwardBase;PassFlags=OnlyDirectional;True;2;0;;0;0;Standard;0;0;1;True;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT3;0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT3;0,0,0;False;0
WireConnection;7;0;6;0
WireConnection;134;0;7;0
WireConnection;135;0;134;0
WireConnection;119;0;117;0
WireConnection;123;0;117;0
WireConnection;123;1;120;0
WireConnection;122;0;119;0
WireConnection;122;1;118;0
WireConnection;121;0;135;0
WireConnection;84;0;73;0
WireConnection;103;0;73;0
WireConnection;103;1;72;0
WireConnection;102;0;7;0
WireConnection;124;0;121;0
WireConnection;124;2;123;0
WireConnection;124;4;122;0
WireConnection;108;0;84;0
WireConnection;108;1;104;0
WireConnection;126;0;124;0
WireConnection;126;1;125;0
WireConnection;83;0;102;0
WireConnection;83;2;103;0
WireConnection;83;4;108;0
WireConnection;74;0;83;0
WireConnection;74;1;71;0
WireConnection;127;0;126;0
WireConnection;127;1;121;0
WireConnection;13;5;14;0
WireConnection;21;0;22;0
WireConnection;75;0;74;0
WireConnection;75;1;102;0
WireConnection;129;0;127;0
WireConnection;20;0;13;0
WireConnection;20;1;21;0
WireConnection;130;0;129;0
WireConnection;130;1;129;1
WireConnection;41;0;20;0
WireConnection;77;0;75;0
WireConnection;76;0;77;0
WireConnection;76;1;77;1
WireConnection;131;0;130;0
WireConnection;131;1;129;2
WireConnection;42;0;41;0
WireConnection;42;1;39;0
WireConnection;78;0;76;0
WireConnection;78;1;77;2
WireConnection;138;0;42;0
WireConnection;128;0;125;0
WireConnection;128;1;120;0
WireConnection;132;0;121;0
WireConnection;132;1;131;0
WireConnection;81;0;71;0
WireConnection;81;1;72;0
WireConnection;79;0;102;0
WireConnection;79;1;78;0
WireConnection;133;0;132;0
WireConnection;133;1;128;0
WireConnection;137;1;133;0
WireConnection;137;2;140;0
WireConnection;80;0;79;0
WireConnection;80;1;81;0
WireConnection;143;0;137;1
WireConnection;116;1;133;0
WireConnection;116;2;140;0
WireConnection;4;1;80;0
WireConnection;4;2;139;0
WireConnection;136;0;4;0
WireConnection;136;1;116;0
WireConnection;136;2;143;0
WireConnection;12;0;136;0
WireConnection;12;1;11;0
WireConnection;12;2;20;0
WireConnection;45;0;44;0
WireConnection;8;0;3;0
WireConnection;8;1;9;0
WireConnection;36;0;12;0
WireConnection;36;1;35;0
WireConnection;110;0;8;0
WireConnection;110;1;13;0
WireConnection;110;2;36;0
WireConnection;110;3;111;0
WireConnection;110;4;38;0
ASEEND*/
//CHKSM=EF1DCD2ED580BDC9141CDAB8B2EE71F56887FAE1