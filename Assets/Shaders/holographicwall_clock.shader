// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Holographic Wall - Clock"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_CubeBG("CubeBG", CUBE) = "black" {}
		_Color("Color", Color) = (0,0,0,0)
		[HDR]_ScreenColor("ScreenColor", Color) = (1,1,1,1)
		_EmissionBakedMultipler("Emission Baked Multiplier", Float) = 1.0
		_BumpMap("BumpMap", 2D) = "bump" {}
		_NormalScale("NormalScale", Float) = 1
		_EmissionMask("Emission Mask", 2D) = "white" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_FresnelBlur("FresnelBlur", Range( 0 , 10)) = 0
		_Pos("Pos", Vector) = (0,0,0,0)
		_Pos2("Pos2", Vector) = (0,0,0,0)
		_Boxscale("Box scale", Vector) = (0,0,0,0)
		[NoScaleOffset]_OverlayTexture("Overlay Texture", 2D) = "black" {}
		_TextureScaleandOffset("Texture Scale and Offset", Vector) = (1,1,1,1)
		[HDR]_OverlayColor("Overlay Color", Color) = (1,1,1,0)
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
			uniform float4 _ScreenColor;
			uniform float4 _TextureScaleandOffset;
			uniform float4 _OverlayColor;
			uniform sampler2D _OverlayTexture;
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
				float3 temp_output_80_0 = ( ( -ase_worldViewDir * min( min( break77.x , break77.y ) , break77.z ) ) + ( i.vPositionWs.xyz - _Pos ) );
				float3 tanToWorld0 = float3( float3(i.vTangentUWs.xy,0).x, i.vTangentVWs.xyz.x, i.vNormalWs.xyz.x );
				float3 tanToWorld1 = float3( float3(i.vTangentUWs.xy,0).y, i.vTangentVWs.xyz.y, i.vNormalWs.xyz.y );
				float3 tanToWorld2 = float3( float3(i.vTangentUWs.xy,0).z, i.vTangentVWs.xyz.z, i.vNormalWs.xyz.z );
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float3 normalizeResult21 = normalize( ase_tanViewDir );
				float dotResult20 = dot( tex2DNode13 , normalizeResult21 );
				float clampResult155 = clamp( temp_output_80_0.x , 0.0 , 1.0 );
				float2 temp_output_124_0 = ( ( ( (temp_output_80_0).zy * float2( -1,1 ) ) * (_TextureScaleandOffset).xy ) + (_TextureScaleandOffset).zw );
				float2 break133 = temp_output_124_0;
				float clampResult142 = clamp( floor( ( max( distance( break133.x , 0.5 ) , distance( break133.y , 0.5 ) ) * 2.0 ) ) , 0.0 , 1.0 );
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
				float3 Emission = ( ( ( texCUBElod( _CubeBG, float4( temp_output_80_0, ( ( 1.0 - dotResult20 ) * _FresnelBlur )) ) * _ScreenColor * dotResult20 ) + ( clampResult155 * ( 1.0 - clampResult142 ) * _OverlayColor * tex2D( _OverlayTexture, temp_output_124_0 ) ) ) * tex2D( _EmissionMask, uv_EmissionMask ) ).rgb;
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
            Tags {"LightMode"="Meta"}
            Cull Off
            CGPROGRAM
 
            #include"UnityStandardMeta.cginc"
 
          //  sampler2D _GIAlbedoTex;
			fixed _EmissionBakedMultipler;
			fixed4 _ScreenColor;
			uniform samplerCUBE _CubeBG;
			fixed _CubeBlur;

         //   fixed4 _GIAlbedoColor;

			struct v2f_meta2
			{
				float4 uv		: TEXCOORD0;
				float4 pos		: SV_POSITION;
				float4 normal : TEXCOORD1;
			};

			v2f_meta2 vert_meta2 (VertexInput v)
			{
				v2f_meta2 o;
				o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
				o.uv = TexCoords(v);
				o.normal.xyz = UnityObjectToWorldNormal(v.normal).xyz;
				o.normal.w = 0;
				return o;
			}


		 
            float4 frag_meta2 (v2f_meta2 i): SV_Target
            {
                // we're interested in diffuse & specular colors,
                // and surface roughness to produce final albedo.
               
                FragmentCommonData data = UNITY_SETUP_BRDF_INPUT (i.uv);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT(UnityMetaInput, o);
                fixed4 c = tex2D (_MainTex, i.uv);
                o.Albedo = fixed3(c.rgb * _Color.rgb);
				

			//	UnityObjectToWorldNormal(v.ase_normal)			
			 	fixed4 screen = texCUBElod( _CubeBG, fixed4(-i.normal.rgb, _CubeBlur ) );
				o.Emission =  _EmissionBakedMultipler * _ScreenColor * screen;

                return UnityMetaFragment(o);
            }
           
            #pragma vertex vert_meta2
            #pragma fragment frag_meta2
            #pragma shader_feature _EMISSION
			#pragma shader_feature S_EMISSIVE_MULTI		
            #pragma shader_feature _METALLICGLOSSMAP
            #pragma shader_feature ___ _DETAIL_MULX2
            ENDCG
        }
	}
//	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16900
7;451;1524;600;1285.556;59.23447;1.700047;True;True
Node;AmplifyShaderEditor.Vector3Node;73;-3118.625,773.5765;Float;False;Property;_Boxscale;Box scale;14;0;Create;True;0;0;False;0;0,0,0;1698,650,2000;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;6;-3795.481,-283.0136;Float;True;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;104;-3070.449,1255.855;Float;False;Property;_Pos2;Pos2;13;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;7;-3525.523,-268.1664;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;84;-2757.575,946.9216;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;72;-3073.384,1062.442;Float;False;Property;_Pos;Pos;12;0;Create;True;0;0;False;0;0,0,0;-150,-80,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-2713.506,1168.843;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;-2845.367,806.2659;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;102;-2306.436,416.4436;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCIf;83;-2534.372,688.8364;Float;False;6;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;71;-2940.73,520.2442;Float;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleSubtractOpNode;74;-2229.187,567.8656;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;75;-1994.823,505.3764;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;77;-1775.928,669.347;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMinOpNode;76;-1487.128,654.9474;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;78;-1347.728,680.3478;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1250.528,568.9465;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;81;-1684.628,1044.993;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;80;-1055.48,549.4756;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwizzleNode;116;-809.2871,596.761;Float;False;FLOAT2;2;1;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;122;-1259.287,925.761;Float;False;Property;_TextureScaleandOffset;Texture Scale and Offset;16;0;Create;True;0;0;False;0;1,1,1,1;0.004,0.008,0.18,-4.16;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-774.2871,687.761;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;123;-984.2871,889.761;Float;False;FLOAT2;0;1;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;125;-881.2871,1000.761;Float;False;FLOAT2;2;3;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-797.2871,807.761;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.01,0.01;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;124;-648.2871,851.761;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;133;-891.1901,1197.985;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;22;-3413.815,-438.7008;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;14;-3368.622,-587.332;Float;False;Property;_NormalScale;NormalScale;5;0;Create;True;0;0;False;0;1;0.32;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;134;-638.9163,1283.859;Float;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;131;-636.3677,1193.962;Float;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;135;-437.1848,1194.555;Float;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;21;-3171.815,-434.7008;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;13;-3153.333,-634.7465;Float;True;Property;_BumpMap;BumpMap;4;0;Create;True;0;0;False;0;None;b7090b2e6e84a074386ba1a0caad9c17;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;150;-228.1718,1144.093;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;20;-2840.596,-459.1613;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2664.302,-108.1178;Float;False;Property;_FresnelBlur;FresnelBlur;10;0;Create;True;0;0;False;0;0;0.36;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;141;-61.37751,1201.11;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;41;-2574.462,-321.2434;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-2331.791,-408.7857;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;8;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;142;111.1256,1202.739;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;153;-599.3752,542.3204;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;113;-285.5501,903.708;Float;True;Property;_OverlayTexture;Overlay Texture;15;1;[NoScaleOffset];Create;True;0;0;False;0;None;78ea81da8396dbc4bb70c3ba64c78443;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;149;48.87611,1103.599;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4;-876.7577,241.4463;Float;True;Property;_CubeBG;CubeBG;1;0;Create;True;0;0;False;0;None;fa933b6d7e00ecf4a84cc99589d2a9bd;True;0;False;black;LockedToCube;False;Object;-1;MipLevel;Cube;6;0;SAMPLER2D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;151;-219.6253,1505.174;Float;False;Property;_OverlayColor;Overlay Color;17;1;[HDR];Create;True;0;0;False;0;1,1,1,0;32,3,1.8,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;11;-563.9006,356.8009;Float;False;Property;_ScreenColor;ScreenColor;3;1;[HDR];Create;True;0;0;False;0;1,1,1,1;1.85098,1.6,1.003922,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;155;-205.2921,709.9943;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;148;31.79188,959.6609;Float;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-194.861,277.2519;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;9;-147.0273,-476.3199;Float;False;Property;_Color;Color;2;0;Create;True;0;0;False;0;0,0,0,0;0.197579,0.2120817,0.2264149,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;35;177.3649,477.5083;Float;True;Property;_EmissionMask;Emission Mask;6;0;Create;True;0;0;False;0;None;03ad506bc40f22747a5f991faf00f9d8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-248.0273,-305.3199;Float;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;114;51.58541,204.4135;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-12.5544,23.64542;Float;False;Property;_Metallic;Metallic;9;0;Create;True;0;0;False;0;0;0.587;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;128.9726,-281.32;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;227.1576,240.4339;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;57;-3136.195,237.0384;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RotatorNode;54;-3304.195,78.03832;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;45;536.5063,716.9423;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;62;-2900.121,-92.15472;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;112;526.4616,585.4877;Float;False;Global;globalScreenScaler;globalScreenScaler;15;0;Create;True;0;0;False;0;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;1.7686,107.8699;Float;False;Property;_Smoothness;Smoothness;8;0;Create;True;0;0;False;0;0;0.759;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;109;-3316.039,-234.9975;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;44;204.5166,730.7987;Float;True;Property;_EmissionMask2;EmissionMask2;7;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-3606.944,103.7697;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;56;-2743.586,268.7626;Float;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;55;-3464.195,50.03834;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-3923.679,49.1406;Float;False;Property;_Rotation;Rotation;11;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;58;-3858.495,129.9314;Float;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;110;1016.623,-36.20657;Float;False;True;2;Float;ASEMaterialInspector;0;11;SLZ/Holographic Wall - Clock;1f6ac94e27bd0934ab97faa6217ad58e;True;VRBase;0;0;VRBase;15;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;0;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;LightMode=ForwardBase;PassFlags=OnlyDirectional;True;2;0;;0;0;Standard;0;0;1;True;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT3;0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT3;0,0,0;False;0
WireConnection;7;0;6;0
WireConnection;84;0;73;0
WireConnection;108;0;84;0
WireConnection;108;1;104;0
WireConnection;103;0;73;0
WireConnection;103;1;72;0
WireConnection;102;0;7;0
WireConnection;83;0;102;0
WireConnection;83;2;103;0
WireConnection;83;4;108;0
WireConnection;74;0;83;0
WireConnection;74;1;71;0
WireConnection;75;0;74;0
WireConnection;75;1;102;0
WireConnection;77;0;75;0
WireConnection;76;0;77;0
WireConnection;76;1;77;1
WireConnection;78;0;76;0
WireConnection;78;1;77;2
WireConnection;79;0;102;0
WireConnection;79;1;78;0
WireConnection;81;0;71;0
WireConnection;81;1;72;0
WireConnection;80;0;79;0
WireConnection;80;1;81;0
WireConnection;116;0;80;0
WireConnection;119;0;116;0
WireConnection;123;0;122;0
WireConnection;125;0;122;0
WireConnection;115;0;119;0
WireConnection;115;1;123;0
WireConnection;124;0;115;0
WireConnection;124;1;125;0
WireConnection;133;0;124;0
WireConnection;134;0;133;1
WireConnection;131;0;133;0
WireConnection;135;0;131;0
WireConnection;135;1;134;0
WireConnection;21;0;22;0
WireConnection;13;5;14;0
WireConnection;150;0;135;0
WireConnection;20;0;13;0
WireConnection;20;1;21;0
WireConnection;141;0;150;0
WireConnection;41;0;20;0
WireConnection;42;0;41;0
WireConnection;42;1;39;0
WireConnection;142;0;141;0
WireConnection;153;0;80;0
WireConnection;113;1;124;0
WireConnection;149;0;142;0
WireConnection;4;1;80;0
WireConnection;4;2;42;0
WireConnection;155;0;153;0
WireConnection;148;0;155;0
WireConnection;148;1;149;0
WireConnection;148;2;151;0
WireConnection;148;3;113;0
WireConnection;12;0;4;0
WireConnection;12;1;11;0
WireConnection;12;2;20;0
WireConnection;114;0;12;0
WireConnection;114;1;148;0
WireConnection;8;0;3;0
WireConnection;8;1;9;0
WireConnection;36;0;114;0
WireConnection;36;1;35;0
WireConnection;57;0;54;0
WireConnection;54;0;55;0
WireConnection;54;2;59;0
WireConnection;45;0;44;0
WireConnection;109;0;7;0
WireConnection;59;0;51;0
WireConnection;59;1;58;0
WireConnection;56;0;57;0
WireConnection;56;1;109;1
WireConnection;56;2;57;1
WireConnection;55;0;109;0
WireConnection;55;1;109;2
WireConnection;110;0;8;0
WireConnection;110;1;13;0
WireConnection;110;2;36;0
WireConnection;110;3;111;0
WireConnection;110;4;38;0
ASEEND*/
//CHKSM=F3B1A123A047A4BD4D1A0277A02EEDD014D39711