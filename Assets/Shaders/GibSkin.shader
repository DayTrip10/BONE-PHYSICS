// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/GibSkin"
{
	Properties
	{
		[NoScaleOffset]_MainTex("MainTex", 2D) = "white" {}
		[NoScaleOffset]_BumpMap("BumpMap", 2D) = "bump" {}
		[NoScaleOffset]_MetallicGlossMap("MetallicGlossMap", 2D) = "black" {}
		[NoScaleOffset]_OcclusionMap("OcclusionMap", 2D) = "white" {}
		[NoScaleOffset]_BloodyTex("BloodyTex", 2D) = "white" {}
		_BloodyColor("BloodyColor", Color) = (1,1,1,0.5607843)
		_BloodyTexScale("Bloody Tex Scale", Float) = 1
		_fSmoothness("Smoothness", Range( 0 , 1)) = 0
		_fMetallic("Metallic", Range( 0 , 1)) = 0
		[NoScaleOffset][Normal]_BloodyNormal("BloodyNormal", 2D) = "bump" {}
		_Power("Power", Float) = 0.25
		[HideInInspector][PerRendererData]_NumberOfHits("Number Of Hits", Int) = 0
		[HideInInspector][PerRendererData]_NumberOfElipsoids("NumberOfElipsoids", Int) = 0
		_Color("Color", Color) = (1,1,1,1)
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

		//	#pragma multi_compile	LIGHTMAP_OFF LIGHTMAP_ON
			
		//	#pragma multi_compile	DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
		//	#pragma multi_compile	DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON	

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
				float4 ase_texcoord2 : TEXCOORD2;

				#if ( S_OVERRIDE_LIGHTMAP || LIGHTMAP_ON || DYNAMICLIGHTMAP_ON )
					#if ( DYNAMICLIGHTMAP_ON )
						centroid float4 vLightmapUV : TEXCOORD3;
					#else
						centroid float2 vLightmapUV : TEXCOORD3;
					#endif
				#endif
			};

			uniform sampler2D _BloodyTex;
			uniform float _BloodyTexScale;
			uniform float4 _BloodyColor;
			uniform float4x4 EllipsoidPosArray[128];
			uniform int _NumberOfHits;
			uniform float4 _Color;
			uniform sampler2D _MainTex;
			uniform float _Power;
			uniform float4x4 _ElipsoidMatrices[1];
			uniform int _NumberOfElipsoids;
			uniform sampler2D _BloodyNormal;
			uniform sampler2D _BumpMap;
			uniform float _fMetallic;
			uniform float _fSmoothness;
			uniform sampler2D _MetallicGlossMap;
			uniform sampler2D _OcclusionMap;
			float MyCustomExpression268( float4x4 Ellipsoids , float3 Posespace , int LoopNumber )
			{
				 float HitDistance = 1;
				for ( int i = 0; i <LoopNumber; i++ ){
				float3 LocalPosP = Posespace - EllipsoidPosArray[i][3].xyz;
				HitDistance =  min( HitDistance, clamp(  distance( mul( LocalPosP , EllipsoidPosArray[i] ) , float3( 0,0,0 ) ), 0 ,1)  );
				}
				return HitDistance;
			}
			
			float MyCustomExpression245( float4x4 Ellipsoids , float3 Posespace , int LoopNumber )
			{
				 float HitDistance = 1;
				for ( int i = 0; i <LoopNumber; i++ ){
				 HitDistance *= clamp(distance( mul( float4( ( Posespace - (Ellipsoids[0][3]) ) , 0.0 ), Ellipsoids[0] ) , float3( 0,0,0 ) ), 0 ,1);
				}
				return HitDistance;
			}
			

			//Vertex Shader
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				o.ase_texcoord1.xyz = v.texcoord1.xyzw.xyz;
				o.ase_texcoord2.xy = v.texcoord.xyzw.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.zw = 0;

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
				float3 uv5 = i.ase_texcoord1.xyz;
				uv5.xy = i.ase_texcoord1.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_74_0 = (( uv5 / _BloodyTexScale )).xy;
				float4 tex2DNode73 = tex2D( _BloodyTex, temp_output_74_0 );
				float3 break238 = ( abs( i.vNormalWs.xyz ) * float3( 1,1,1 ) );
				float2 temp_output_76_0 = (( uv5 / _BloodyTexScale )).yz;
				float2 temp_output_78_0 = (( uv5 / _BloodyTexScale )).xz;
				float4x4 Ellipsoids268 = EllipsoidPosArray[0];
				float3 Posespace268 = uv5;
				int LoopNumber268 = _NumberOfHits;
				float localMyCustomExpression268 = MyCustomExpression268( Ellipsoids268 , Posespace268 , LoopNumber268 );
				float MessuredDistance169 = localMyCustomExpression268;
				float clampResult262 = clamp( ( MessuredDistance169 * 5.0 ) , 0.0 , 1.0 );
				float4 lerpResult130 = lerp( ( ( ( ( tex2DNode73.r * break238.z ) + ( break238.x * tex2D( _BloodyTex, temp_output_76_0 ).r ) + ( break238.y * tex2D( _BloodyTex, temp_output_78_0 ).r ) ) / 3.0 ) * _BloodyColor ) , _BloodyColor , ( _BloodyColor.a * clampResult262 ));
				float2 uv_MainTex64 = i.ase_texcoord2.xy;
				float clampResult97 = clamp( ( ( pow( MessuredDistance169 , _Power ) * 2.0 ) - 1.0 ) , 0.0 , 1.0 );
				float4x4 Ellipsoids245 = _ElipsoidMatrices[0];
				float3 uv181 = i.ase_texcoord1.xyz;
				uv181.xy = i.ase_texcoord1.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float3 Posespace245 = uv181;
				int LoopNumber245 = _NumberOfElipsoids;
				float localMyCustomExpression245 = MyCustomExpression245( Ellipsoids245 , Posespace245 , LoopNumber245 );
				float CutoutEllipsoidDistance206 = localMyCustomExpression245;
				float clampResult210 = clamp( CutoutEllipsoidDistance206 , 0.0 , 1.0 );
				float blendOpSrc125 = ( clampResult97 * clampResult210 );
				float blendOpDest125 = ( ( ( tex2DNode73.r * break238.z ) + ( break238.x * tex2D( _BloodyTex, temp_output_76_0 ).r ) + ( break238.y * tex2D( _BloodyTex, temp_output_78_0 ).r ) ) / 3.0 );
				float Hits166 = ( saturate( (( blendOpSrc125 > 0.5 ) ? ( blendOpDest125 / ( ( 1.0 - blendOpSrc125 ) * 2.0 ) ) : ( 1.0 - ( ( ( 1.0 - blendOpDest125 ) * 0.5 ) / blendOpSrc125 ) ) ) ));
				float temp_output_227_0 = round( Hits166 );
				float4 lerpResult57 = lerp( lerpResult130 , ( _Color * tex2D( _MainTex, uv_MainTex64 ) ) , temp_output_227_0);
				
				float2 uv_BumpMap80 = i.ase_texcoord2.xy;
				float3 lerpResult129 = lerp( ( ( UnpackNormal( tex2D( _BloodyNormal, temp_output_74_0 ) ) + UnpackNormal( tex2D( _BloodyNormal, temp_output_76_0 ) ) + UnpackNormal( tex2D( _BloodyNormal, temp_output_78_0 ) ) ) / float3( 3,3,3 ) ) , UnpackNormal( tex2D( _BumpMap, uv_BumpMap80 ) ) , temp_output_227_0);
				
				float2 appendResult258 = (float2(_fMetallic , _fSmoothness));
				float2 uv_MetallicGlossMap133 = i.ase_texcoord2.xy;
				float4 tex2DNode133 = tex2D( _MetallicGlossMap, uv_MetallicGlossMap133 );
				float2 appendResult259 = (float2(tex2DNode133.r , tex2DNode133.a));
				float2 lerpResult132 = lerp( appendResult258 , appendResult259 , temp_output_227_0);
				float2 break136 = lerpResult132;
				float3 temp_cast_1 = (break136.x).xxx;
				
				float2 uv_OcclusionMap82 = i.ase_texcoord2.xy;
				float clampResult281 = clamp( ( MessuredDistance169 * 1.5 ) , 0.0 , 1.0 );
				float smoothstepResult282 = smoothstep( 0.2 , 0.8 , clampResult281);
				float temp_output_250_0 = ( tex2D( _OcclusionMap, uv_OcclusionMap82 ).g * smoothstepResult282 );
				


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


				float3 Albedo = lerpResult57.rgb;
				float3 Normal = lerpResult129;  //vNormalTs
				float3 Emission = fixed3(0,0,0);
				float Metallic = temp_cast_1;
				float Roughness = 1 - saturate( break136.y );
				float Retroreflective = 0;
				float AnisotropicDirection = 0;
				float AnisotropicRatio = 1;
				float DiffuseOcclusion = temp_output_250_0;
				float SpecularOcclusion = temp_output_250_0;
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
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=15800
1989;2127;1524;964;-2145.24;824.3438;1.646498;True;True
Node;AmplifyShaderEditor.CommentaryNode;165;-1055.653,-2541.567;Float;False;3209.053;1941.855;Comment;49;96;215;214;163;175;162;130;174;127;258;176;126;260;166;161;160;262;47;256;159;257;125;211;261;210;157;97;156;209;109;241;240;239;106;73;77;75;104;76;74;72;169;99;78;86;88;89;48;272;Posespace Hits;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;48;-475.2962,-2041.279;Float;False;929.4583;732.084;Posspace impacts;5;36;31;38;5;268;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;89;225.1385,-2208.598;Float;False;Property;_BloodyTexScale;Bloody Tex Scale;6;0;Create;True;0;0;False;0;1;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;236;1091.344,-2897.511;Float;False;267;229;Comment;1;234;Replace with Pose normal;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-425.2963,-1991.279;Float;False;1;-1;3;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;234;1141.344,-2847.511;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;207;-1008.781,-261.4375;Float;False;2002.218;639.0782;Comment;10;189;187;188;246;193;206;190;183;179;245;Cutout Area;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;88;496.1389,-2227.598;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.IntNode;38;-414.3478,-1821.357;Float;False;Property;_NumberOfHits;Number Of Hits;11;2;[HideInInspector];[PerRendererData];Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.GlobalArrayNode;36;-422.5289,-1721.496;Float;False;EllipsoidPosArray;0;128;3;False;2;0;INT;0;False;1;INT;0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.CommentaryNode;183;-595.6402,7.407621;Float;False;241;210;Posespace;1;181;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CustomExpressionNode;268;-10.21251,-1732.504;Float;False; float HitDistance = 1@$$for ( int i = 0@ i <LoopNumber@ i++ ){$$float3 LocalPosP = Posespace - EllipsoidPosArray[i][3].xyz@$$HitDistance =  min( HitDistance, clamp(  distance( mul( LocalPosP , EllipsoidPosArray[i] ) , float3( 0,0,0 ) ), 0 ,1)  )@$$}$$return HitDistance@;1;False;3;True;Ellipsoids;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;In;sdads;Float;True;Posespace;FLOAT3;0,0,0;In;;Float;True;LoopNumber;INT;0;In;;Float;My Custom Expression;True;False;0;3;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;2;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;235;1384.895,-2901.806;Float;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RelayNode;86;666.139,-2235.298;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;244;1763.711,-2858.661;Float;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;72;1053.942,-2491.567;Float;True;Property;_BloodyTex;BloodyTex;4;1;[NoScaleOffset];Create;True;0;0;False;0;None;b16415f2f06fcb14cae4d345fda40d45;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SwizzleNode;78;890.591,-2112.644;Float;False;FLOAT2;0;2;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;74;883.924,-2273.549;Float;False;FLOAT2;0;1;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SwizzleNode;76;882.8132,-2192.43;Float;False;FLOAT2;1;2;2;2;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;181;-583.6402,57.40746;Float;False;1;-1;3;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GlobalArrayNode;193;-958.7809,-190.1823;Float;False;_ElipsoidMatrices;0;1;3;False;2;0;INT;0;False;1;INT;0;False;1;FLOAT4x4;0
Node;AmplifyShaderEditor.IntNode;246;-986.5919,-73.3175;Float;False;Property;_NumberOfElipsoids;NumberOfElipsoids;12;2;[HideInInspector];[PerRendererData];Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;169;480.7595,-1801.925;Float;False;MessuredDistance;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;99;689.1649,-1698.159;Float;False;Property;_Power;Power;10;0;Create;True;0;0;False;0;0.25;0.24;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;238;1891.984,-2643.984;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.PowerNode;104;983.454,-1807.24;Float;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;245;-178.8357,-198.2128;Float;False; float HitDistance = 1@$$for ( int i = 0@ i <LoopNumber@ i++ ){$$ HitDistance *= clamp(distance( mul( float4( ( Posespace - (Ellipsoids[0][3]) ) , 0.0 ), Ellipsoids[0] ) , float3( 0,0,0 ) ), 0 ,1)@$$$}$$return HitDistance@$;1;False;3;True;Ellipsoids;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;In;;Float;True;Posespace;FLOAT3;0,0,0;In;;Float;True;LoopNumber;INT;0;In;;Float;My Custom Expression;True;False;0;3;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;2;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;77;1422.863,-1999.299;Float;True;Property;_TextureSample2;Texture Sample 2;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;75;1422.865,-2201.321;Float;True;Property;_TextureSample1;Texture Sample 1;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;73;1421.753,-2402.451;Float;True;Property;_TextureSample0;Texture Sample 0;6;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;240;1730.419,-2229.915;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;239;1734.958,-2331.246;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;1165.454,-1783.24;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;687.2795,-173.3307;Float;False;CutoutEllipsoidDistance;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;241;1738.598,-2120.524;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;109;1358.353,-1767.411;Float;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;209;974.8678,-1408.739;Float;False;206;CutoutEllipsoidDistance;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;156;1979.695,-2251.418;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;97;1440.123,-1656.383;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;210;1269.605,-1407.863;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;157;1991.375,-2085.87;Float;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;242;2159.914,-1924.196;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;1488.107,-1460.107;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;159;589.4178,-1261.713;Float;True;Property;_BloodyNormal;BloodyNormal;9;2;[NoScaleOffset];[Normal];Create;True;0;0;False;0;None;a96581eb69cfd2e4b93e56eac104d0b0;True;bump;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.BlendOpsNode;125;1686.64,-1472.446;Float;False;VividLight;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;261;1058.877,-1578.583;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;47;1613.814,-1764.718;Float;False;Property;_BloodyColor;BloodyColor;5;0;Create;True;0;0;False;0;1,1,1,0.5607843;1,0.7215686,0,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;279;3534.635,472.9489;Float;False;169;MessuredDistance;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;257;1451.595,-739.5913;Float;False;Property;_fSmoothness;Smoothness;7;0;Create;False;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;160;1105.907,-1043.509;Float;True;Property;_TextureSample4;Texture Sample 4;15;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;177;1668.231,-223.648;Float;False;525.8;682.4663;Variables;5;133;80;64;276;277;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;166;1786.956,-1274.666;Float;False;Hits;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;127;1110.37,-1239.982;Float;True;Property;_Bloody;Bloody;12;0;Create;True;0;0;False;0;None;a96581eb69cfd2e4b93e56eac104d0b0;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;262;1240.124,-1578.862;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;278;3535.635,422.9491;Float;False;877.6423;689.9533;Center hole spec;4;283;282;281;280;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;161;1105.907,-849.1912;Float;True;Property;_TextureSample5;Texture Sample 5;15;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;256;1451.595,-814.5913;Float;False;Property;_fMetallic;Metallic;8;0;Create;False;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;126;1961.932,-1794.582;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;280;3831.684,495.24;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;258;1747.595,-786.5913;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;133;1699.14,65.82836;Float;True;Property;_MetallicGlossMap;MetallicGlossMap;2;1;[NoScaleOffset];Create;True;0;0;False;0;None;66ab07907aee6ce428aa2f19e7d91d71;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;167;1974.252,-399.9579;Float;False;166;Hits;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;176;1922.182,-805.6692;Float;False;204;160;Specular;1;173;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;162;1501.055,-1008.169;Float;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;260;1764.026,-1569.761;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;163;1645.033,-1010.4;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;3,3,3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;175;1921.403,-979.554;Float;False;204.0001;160;Normal;1;172;;0.5,0.5,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;259;2224.185,20.34253;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RelayNode;173;1974.071,-750.0019;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ClampOpNode;281;4015.145,484.1299;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;227;2211.016,-276.9655;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;174;1921.389,-1149.252;Float;False;204;160;Bloody;1;171;;1,0.0990566,0.0990566,1;0;0
Node;AmplifyShaderEditor.SamplerNode;64;1699.231,-176.648;Float;True;Property;_MainTex;MainTex;0;1;[NoScaleOffset];Create;True;0;0;False;0;None;ad205c574f8ffb643b1eac78e503a893;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;130;1996.332,-1470.467;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;277;1915.735,-300.0089;Float;False;Property;_Color;Color;13;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;80;1702.031,253.8183;Float;True;Property;_BumpMap;BumpMap;1;1;[NoScaleOffset];Create;True;0;0;False;0;None;4a02560c758922f47861407edd95a8a7;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RelayNode;171;1971.389,-1099.252;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;282;4031.243,646.2253;Float;False;3;0;FLOAT;0;False;1;FLOAT;0.2;False;2;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;276;2061.646,-55.4516;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;132;2482.726,-129.8822;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;82;3713.892,182.5883;Float;True;Property;_OcclusionMap;OcclusionMap;3;1;[NoScaleOffset];Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RelayNode;172;1974.192,-921.6085;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VectorFromMatrixNode;179;-703.3745,236.1781;Float;False;Row;3;1;0;FLOAT4x4;1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CustomExpressionNode;43;1469.646,-202.7031;Float;False;  return tex2D(_MainTex, UV)@;4;False;1;True;UV;FLOAT2;0,0;In;;Float;MainTex 2DSampler;True;False;0;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;264;2371.687,-1548.321;Float;False;myVarName;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;265;2205.687,-1508.321;Float;False;FLOAT;3;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;143;3594.62,-424.9737;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;170;3339.87,-450.6737;Float;True;264;myVarName;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;213;2298.838,-1344.29;Float;False;VividLight;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;202;4887.597,-721.5305;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SwitchByFaceNode;252;5145.095,-953.9115;Float;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;42;1113.319,-130.049;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RoundOpNode;194;4214.587,-605.8745;Float;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;283;3551.333,726.3292;Float;False;166;Hits;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;228;4723.843,-604.0764;Float;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CustomExpressionNode;50;1501.916,2.254181;Float;False;  return tex2D(_OcclusionMap, UV)@;4;False;1;True;UV;FLOAT2;0,0;In;;Float;AO 2DSampler;True;False;0;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;57;2518.404,301.819;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;272;589.1013,-1637.395;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;31;-41.18688,-1975.971;Float;False; float HitDistance = 1@$for ( int i = 0@ i <In0@ i++ ){$ HitDistance *= clamp(  distance( Posespace.xyz , EllipsoidPosArray[i].xyz) / EllipsoidPosArray[i].w, 0,1  )@$}$$//EllipsoidPosArray[i]$$return HitDistance@$;1;False;3;True;In0;INT;1;In;;Float;True;Posespace;FLOAT3;0,0,0;In;;Float;True;PosArray;FLOAT4;0,0,0,0;In;;Float;Distance Loop;True;False;0;3;0;INT;1;False;1;FLOAT3;0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;49;1495.391,-98.06308;Float;False;  return tex2D(_BumpMap, UV)@;4;False;1;True;UV;FLOAT2;0,0;In;;Float;Normal 2DSampler;True;False;0;1;0;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RelayNode;230;2579.295,-1302.056;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;195;4505.88,-747.5179;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;187;-174.1741,46.00196;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;189;-11.77777,-72.55127;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;214;1481.792,-1351.986;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;267;3987.488,-332.8414;Float;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;129;2489.134,81.85724;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;96;772.1591,-1909.448;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;190;297.889,-89.62183;Float;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;250;4281.962,105.3795;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;136;2715.368,-114.0288;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ClampOpNode;219;4449.594,-576.0275;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;215;1479.792,-1259.986;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;188;-498.5367,231.1391;Float;False;FLOAT3;0;1;2;3;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;275;4598.987,-193.0128;Float;False;True;2;Float;ASEMaterialInspector;0;10;SLZ/GibSkin;1f6ac94e27bd0934ab97faa6217ad58e;0;0;VRBase;15;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;0;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;LightMode=ForwardBase;PassFlags=OnlyDirectional;True;2;0;;0;0;Standard;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT3;0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT3;0,0,0;False;0
WireConnection;88;0;5;0
WireConnection;88;1;89;0
WireConnection;268;0;36;0
WireConnection;268;1;5;0
WireConnection;268;2;38;0
WireConnection;235;0;234;0
WireConnection;86;0;88;0
WireConnection;244;0;235;0
WireConnection;78;0;86;0
WireConnection;74;0;86;0
WireConnection;76;0;86;0
WireConnection;169;0;268;0
WireConnection;238;0;244;0
WireConnection;104;0;169;0
WireConnection;104;1;99;0
WireConnection;245;0;193;0
WireConnection;245;1;181;0
WireConnection;245;2;246;0
WireConnection;77;0;72;0
WireConnection;77;1;78;0
WireConnection;75;0;72;0
WireConnection;75;1;76;0
WireConnection;73;0;72;0
WireConnection;73;1;74;0
WireConnection;240;0;238;0
WireConnection;240;1;75;1
WireConnection;239;0;73;1
WireConnection;239;1;238;2
WireConnection;106;0;104;0
WireConnection;206;0;245;0
WireConnection;241;0;238;1
WireConnection;241;1;77;1
WireConnection;109;0;106;0
WireConnection;156;0;239;0
WireConnection;156;1;240;0
WireConnection;156;2;241;0
WireConnection;97;0;109;0
WireConnection;210;0;209;0
WireConnection;157;0;156;0
WireConnection;242;0;157;0
WireConnection;211;0;97;0
WireConnection;211;1;210;0
WireConnection;125;0;211;0
WireConnection;125;1;242;0
WireConnection;261;0;169;0
WireConnection;160;0;159;0
WireConnection;160;1;76;0
WireConnection;166;0;125;0
WireConnection;127;0;159;0
WireConnection;127;1;74;0
WireConnection;262;0;261;0
WireConnection;161;0;159;0
WireConnection;161;1;78;0
WireConnection;126;0;242;0
WireConnection;126;1;47;0
WireConnection;280;0;279;0
WireConnection;258;0;256;0
WireConnection;258;1;257;0
WireConnection;162;0;127;0
WireConnection;162;1;160;0
WireConnection;162;2;161;0
WireConnection;260;0;47;4
WireConnection;260;1;262;0
WireConnection;163;0;162;0
WireConnection;259;0;133;1
WireConnection;259;1;133;4
WireConnection;173;0;258;0
WireConnection;281;0;280;0
WireConnection;227;0;167;0
WireConnection;130;0;126;0
WireConnection;130;1;47;0
WireConnection;130;2;260;0
WireConnection;171;0;130;0
WireConnection;282;0;281;0
WireConnection;276;0;277;0
WireConnection;276;1;64;0
WireConnection;132;0;173;0
WireConnection;132;1;259;0
WireConnection;132;2;227;0
WireConnection;172;0;163;0
WireConnection;179;0;193;0
WireConnection;43;0;42;0
WireConnection;264;0;265;0
WireConnection;265;0;130;0
WireConnection;143;0;170;0
WireConnection;213;0;215;0
WireConnection;213;1;242;0
WireConnection;202;0;195;0
WireConnection;252;0;202;0
WireConnection;194;0;230;0
WireConnection;228;0;195;0
WireConnection;228;1;219;0
WireConnection;50;0;42;0
WireConnection;57;0;171;0
WireConnection;57;1;276;0
WireConnection;57;2;227;0
WireConnection;31;0;38;0
WireConnection;31;1;5;0
WireConnection;31;2;36;0
WireConnection;49;0;42;0
WireConnection;230;0;213;0
WireConnection;195;3;219;0
WireConnection;187;0;181;0
WireConnection;187;1;188;0
WireConnection;189;0;187;0
WireConnection;189;1;193;0
WireConnection;214;0;210;0
WireConnection;267;2;227;0
WireConnection;129;0;172;0
WireConnection;129;1;80;0
WireConnection;129;2;227;0
WireConnection;96;0;169;0
WireConnection;96;1;73;1
WireConnection;190;0;189;0
WireConnection;250;0;82;2
WireConnection;250;1;282;0
WireConnection;136;0;132;0
WireConnection;219;0;194;0
WireConnection;215;0;214;0
WireConnection;188;0;179;0
WireConnection;275;0;57;0
WireConnection;275;1;129;0
WireConnection;275;3;136;0
WireConnection;275;4;136;1
WireConnection;275;8;250;0
WireConnection;275;9;250;0
ASEEND*/
//CHKSM=33993B790DFDB6DA56B29F09BB08DC1AAA6FE1AB