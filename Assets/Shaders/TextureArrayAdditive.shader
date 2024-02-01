// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SLZ/Texture Array Additive"
{
	Properties
	{
		_TextureArray("Texture Array", 2DArray ) = "" {}
		[PerRendererData]_TexArraySelection("_TexArraySelection", Int) = 0
		_Color("Color", Color) = (1,1,1,1)
	//	[Space(20)]
	//	[Header(General Properties)]




	//	[KeywordEnum( Specular_Metallic, Anisotropic_Gloss, Retroreflective )] S ("Specular mode", Float) = 0

	//	g_flFresnelFalloff ("Fresnel Falloff Scalar" , Range(0.0 , 10.0 ) ) = 1.0
	//	g_flFresnelExponent( "Fresnel Exponent", Range( 0.5, 10.0 ) ) = 5.0
	//	[Space(5)]
	//	[Toggle( _BRDFMAP )] EnableBRDFMAP( "Enable BRDF remap", Int ) = 0
	//	[NoScaleOffset]g_tBRDFMap("BRDF LUT", 2D) = "grey" {} 
	//	[Space(10)]
	//	[Header(Override Properties)]
	//	g_flCubeMapScalar( "Cube Map Scalar", Range( 0.0, 2.0 ) ) = 1.0
	//	[Toggle( S_RECEIVE_SHADOWS )] ReceiveShadows( "Receive Shadows", Int ) = 1
	//	[Toggle( _FLUORESCENCEMAP )] Fluorescence( "Enable Fluorescence", Int ) = 0

		
	}
	
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
		LOD 100
		
		



		Pass
		{
			Name "VRBase"
			Tags { "LightMode"="ForwardBase" "PassFlags"="OnlyDirectional" } // NOTE: "OnlyDirectional" prevents Unity from baking dynamic lights into SH terms at runtime


			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend One One
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
		//	#pragma shader_feature LIGHTPROBE_SH
			#pragma multi_compile _ D_VALVE_FOG
			#pragma skip_variants SHADOWS_SOFT
		//	#pragma shader_feature	_BRDFMAP
		//	#pragma shader_feature	S_RECEIVE_SHADOWS
		//	#pragma shader_feature  _FLUORESCENCEMAP

		//	#pragma multi_compile	S_SPECULAR_METALLIC S_ANISOTROPIC_GLOSS S_RETROREFLECTIVE	

		//	#pragma multi_compile	LIGHTMAP_OFF LIGHTMAP_ON
			
		//	#pragma multi_compile	DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
		//	#pragma multi_compile	DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON	

			#include "UnityCG.cginc"
		//	#include "UnityLightingCommon.cginc"
			#include "UnityStandardUtils.cginc"
			#include "UnityGlobalIllumination.cginc"
			#include "vr_utils.cginc"
		//	#include "vr_lighting.cginc"
			#include "vr_matrix_palette_skinning.cginc"
			#include "vr_fog.cginc"

	

			#include "vr_zAO.cginc"

			float	g_flFresnelExponent;



			

			struct appdata //VS INPUT
			{
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 vPositionOs : POSITION;
			//	float4 vTangentUOs_flTangentVSign : TANGENT;
			//	float3 normal : NORMAL;
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
				// float3 vNormalWs : NORMAL;
				// float3 vTangentUWs : TEXCOORD4;
				// float3 vTangentVWs : TEXCOORD5;
				float2 vFogCoords : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;

				// #if ( S_OVERRIDE_LIGHTMAP || LIGHTMAP_ON || DYNAMICLIGHTMAP_ON )
				// 	#if ( DYNAMICLIGHTMAP_ON )
				// 		centroid float4 vLightmapUV : TEXCOORD3;
				// 	#else
				// 		centroid float2 vLightmapUV : TEXCOORD3;
				// 	#endif
				// #endif
			};

			uniform UNITY_DECLARE_TEX2DARRAY( _TextureArray );
			uniform float4 _TextureArray_ST;
			//uniform int _TexArraySelection;
			//uniform float4 _Color;			
			UNITY_INSTANCING_BUFFER_START(InstanceProperties)
				UNITY_DEFINE_INSTANCED_PROP(int, _TexArraySelection)
				UNITY_DEFINE_INSTANCED_PROP(float4, _Color)
			UNITY_INSTANCING_BUFFER_END(InstanceProperties)

			//Vertex Shader
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				o.ase_texcoord1.xy = v.texcoord.xyzw.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
		//		o.ase_texcoord1.zw = 0;

				float3 vPositionWs = mul( unity_ObjectToWorld, v.vPositionOs.xyzw ).xyz;

		//		float3 vNormalWs = UnityObjectToWorldNormal( v.normal.xyz );
		//		o.vNormalWs.xyz = vNormalWs.xyz;

		//		float3 vTangentUWs = UnityObjectToWorldDir( v.vTangentUOs_flTangentVSign.xyz ); // Transform tangentU into world space
				//vTangentUWs.xyz = normalize( vTangentUWs.xyz - ( vNormalWs.xyz * dot( vTangentUWs.xyz, vNormalWs.xyz ) ) ); // Force tangentU perpendicular to normal and normalize

				// o.vTangentUWs.xyz = vTangentUWs.xyz;
				// o.vTangentVWs.xyz = cross( vNormalWs.xyz, vTangentUWs.xyz ) * v.vTangentUOs_flTangentVSign.w;

				vPositionWs.xyz +=  float3(0,0,0) ;

				//v.vPositionPs = UnityObjectToClipPos(v.vPositionWs);
				o.vPositionPs.xyzw = UnityObjectToClipPos( v.vPositionOs.xyzw );
				o.vPositionWs = vPositionWs;

				// #if ( LIGHTMAP_ON )
				// {
				// 	// Static lightmaps
				// 	o.vLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				// }
				// #endif

				// #if ( DYNAMICLIGHTMAP_ON )
				// {
				// 	o.vLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				// }
				// #endif

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
				float2 uv_TextureArray = i.ase_texcoord1.xy * _TextureArray_ST.xy + _TextureArray_ST.zw;
				float4 texArray3 = UNITY_SAMPLE_TEX2DARRAY(_TextureArray, float3(uv_TextureArray, UNITY_ACCESS_INSTANCED_PROP(InstanceProperties,_TexArraySelection))  );
				float4 temp_output_5_0 = ( texArray3 * UNITY_ACCESS_INSTANCED_PROP(InstanceProperties,_Color) * texArray3.a );
				


				// float3 vTangentUWs = float3( 1.0, 0.0, 0.0 );
				// float3 vTangentVWs = float3( 0.0, 1.0, 0.0 );

				// vTangentUWs.xyz = i.vTangentUWs.xyz;
				// vTangentVWs.xyz = i.vTangentVWs.xyz;
				
				// float3 vGeometricNormalWs = float3( 0.0, 0.0, 1.0 );		
				// i.vNormalWs.xyz *= ( bIsFrontFace ? 1.0 : -1.0 ); // Flip backfacking normals
				// i.vNormalWs.xyz = normalize( i.vNormalWs.xyz );
				// vGeometricNormalWs.xyz = i.vNormalWs.xyz;

				// float3 vNormalWs = vGeometricNormalWs.xyz;

			//	float3 vNormalTs = float3( 0.0, 0.0, 1.0 );		

				
				//Specular components
				// float3 vSpecColor;
				// float flOneMinusReflectivity;

				// LightingTerms_t lightingTerms;
				// lightingTerms.vDiffuse.rgba = float4( 1.0, 1.0, 1.0 ,1.0);
				// lightingTerms.vSpecular.rgb = float3( 0.0, 0.0, 0.0 );
				// lightingTerms.vIndirectDiffuse.rgb = float3( 0.0, 0.0, 0.0 );
				// lightingTerms.vIndirectSpecular.rgb = float3( 0.0, 0.0, 0.0 );
				// lightingTerms.vTransmissiveSunlight.rgb = float3( 0.0, 0.0, 0.0 );


			//	float3 Albedo = fixed3(0,0,0);
			//	float3 Normal = fixed3(0,0,1);  //vNormalTs
				float3 Emission = temp_output_5_0.rgb;
			//	float Metallic = fixed3(0,0,0);
			//	float Roughness = 1 - saturate( 0 );
			//	float Retroreflective = 0;
			//	float AnisotropicDirection = 0;
			//	float AnisotropicRatio = 1;
			//	float DiffuseOcclusion = 1;
			//	float SpecularOcclusion = 1;
				float Alpha = (temp_output_5_0).a;
			//	float Cutoff = 1;
			//	float3 Fluorescence = fixed3(0,0,0);
			//	float4 Absorbance = fixed4(0,0.5,0.75,0.9);
 		

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



					

				// float4 vLightmapUV = float4( 0.0, 0.0, 0.0, 0.0 );
				// #if ( S_OVERRIDE_LIGHTMAP || LIGHTMAP_ON || DYNAMICLIGHTMAP_ON )
				// {
				// 	vLightmapUV.xy = i.vLightmapUV.xy;
				// 	#if ( DYNAMICLIGHTMAP_ON )
				// 	{
				// 		vLightmapUV.zw = i.vLightmapUV.zw;
				// 	}
				// 	#endif
				// }
				// #endif

				// #if (S_RETROREFLECTIVE)
				// float3 specularinfo = float3(Roughness,Retroreflective,Retroreflective);
				// #elif (S_ANISOTROPIC_GLOSS)
				// float3 specularinfo = float3(Roughness,AnisotropicDirection,AnisotropicRatio);
				// #else 
				// float3 specularinfo = Roughness;
				// #endif

				//Normal falloff Roughness
		// 		Roughness = AdjustRoughnessByGeometricNormal( Roughness, vGeometricNormalWs.xyz );

		// 		Albedo = DiffuseAndSpecularFromMetallic( Albedo.rgb, Metallic, vSpecColor, flOneMinusReflectivity);
		// 		vNormalWs.xyz = Vec3TsToWsNormalized( Normal.xyz, vGeometricNormalWs.xyz, vTangentUWs.xyz, vTangentVWs.xyz  ); //Add tanget normal to world normal
		// 		float ndotv = saturate(dot( vNormalWs.xyz , CalculatePositionToCameraDirWs( i.vPositionWs.xyz ) ));	//base Fresnel falloff
				
		// 		lightingTerms = ComputeLighting( i.vPositionWs, vNormalWs, vTangentUWs.xyz, vTangentVWs, specularinfo, vSpecColor, g_flFresnelExponent, vLightmapUV.xyzw, ndotv );
		// //		lightingTerms = ComputeLighting( i.vPositionWs.xyz, vNormalWs.xyz, vTangentUWs.xyz, vTangentVWs.xyz, vRoughness.xyz, vReflectance.rgb, g_flFresnelExponent, vLightmapUV.xyzw, Dotfresnel );
		// 		finalColor.rgb = (lightingTerms.vDiffuse.rgb + lightingTerms.vIndirectDiffuse.rgb) * Albedo * DiffuseOcclusion;
		// 		finalColor.rgb += (lightingTerms.vSpecular.rgb + lightingTerms.vIndirectSpecular.rgb) * SpecularOcclusion;

				
				// #if ( _FLUORESCENCEMAP )			

				// 	float4 FluorescenceAbsorb = (lightingTerms.vDiffuse + float4( lightingTerms.vIndirectDiffuse.rgb , 0.0 ) ) * Absorbance;					

				// 	float Absorbed_B = FluorescenceAbsorb.b + FluorescenceAbsorb.a;
				// 	float Absorbed_G = Absorbed_B + FluorescenceAbsorb.g;
				// 	float Absorbed_R = Absorbed_G + FluorescenceAbsorb.r;

				// 	float3 LitFluorescence =  float3(Absorbed_R, Absorbed_G, Absorbed_B) * Fluorescence.rgb ;
				// 	finalColor.rgb = max(finalColor.rgb, LitFluorescence.rgb);					

				// #endif

			// #ifdef Z_SHAPEAO 					
			// 	float vAO = CalculateShapeAO( i.vPositionWs.xyz, vNormalWs);
			// 	finalColor.rgb *= vAO;			
			// #endif

				finalColor.rgb += Emission;

			#if ( D_VALVE_FOG )
					// #if (_ALPHAPREMULTIPLY_ON || _ALPHAMULTIPLY_ON || _ALPHAMOD2X_ON)
					// o.vColor.rgba = ApplyFog( o.vColor.rgba, i.vFogCoords.xy, _FogMultiplier, _ColorMultiplier );
					// #else
					finalColor.rgb = ApplyFog( finalColor.rgb, i.vFogCoords.xy, 0.0);
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
//	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16900
258;208;1524;1017;544;209;1;True;True
Node;AmplifyShaderEditor.IntNode;4;-780,112;Float;False;Property;_TexArraySelection;_TexArraySelection;1;1;[PerRendererData];Create;True;0;0;False;0;0;0;0;1;INT;0
Node;AmplifyShaderEditor.TextureArrayNode;3;-532,59;Float;True;Property;_TextureArray;Texture Array;0;0;Create;True;0;0;False;0;None;0;Object;-1;Auto;False;7;6;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;6;-450,-112;Float;False;Property;_Color;Color;2;0;Create;True;0;0;False;0;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-164,56;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SwizzleNode;7;-9,183;Float;False;FLOAT;3;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;201,-21;Float;False;True;2;Float;ASEMaterialInspector;0;11;SLZ/Texture Array Additive;1f6ac94e27bd0934ab97faa6217ad58e;True;VRBase;0;0;VRBase;15;False;False;False;False;False;False;False;False;False;True;2;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;False;0;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;2;LightMode=ForwardBase;PassFlags=OnlyDirectional;True;2;0;;0;0;Standard;0;0;1;True;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT3;0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT3;0,0,0;False;0
WireConnection;3;1;4;0
WireConnection;5;0;3;0
WireConnection;5;1;6;0
WireConnection;5;2;3;4
WireConnection;7;0;5;0
WireConnection;1;2;5;0
WireConnection;1;10;7;0
ASEEND*/
//CHKSM=36629EBDD8EBC0A8ADF56D36B83948C6BE691003