Shader "SLZ/Decal Bump Mod2x"
{
	Properties
	{

		  [NoScaleOffset] [Normal] _BumpMap( "Normal Map", 2D ) = "bump" {}		  
		  _BumpScale( "Bump Scale", Float ) = 1.0	

		 [KeywordEnum(Occlusion, Colorshift)] S ("Texture mode", Float) = 0

		 [NoScaleOffset] _OcclusionMap( "Texture Map", 2D ) = "white" {}
		 _OcclusionStrength( "Occlusion Strength", Range( 0.0, 1.0 ) ) = 1.0
		 _NormalToOcclusion("Normal To Occlusion", Range(0.0, 2.0)) = 1.0
		 _Intensity("Intensity", Float) = 1.0

		 _OffsetFactor ( "Offset Factor", Float ) = -1.0
		 _OffsetUnits  ( "Offset Units", Float ) = -1.0

		// _IndirectMultiplier("Indirect Multiplier", Float) = 1.0
	}
	
	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Geometry+700" }
		LOD 100
		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend DstColor SrcColor   
		Cull Back
		ZWrite Off
		ZTest LEqual
		Offset [_OffsetFactor] , [_OffsetUnits]
		
		

		Pass
		{
			Name "Forward"
			Tags { "LightMode" = "ForwardBase" "PassFlags" = "OnlyDirectional" } // NOTE: "OnlyDirectional" prevents Unity from baking dynamic lights into SH terms at runtime

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#pragma shader_feature LIGHTPROBE_SH
			#pragma multi_compile	S_OCCLUSION S_COLORSHIFT
			#include "UnityCG.cginc"
			#include "UnityLightingCommon.cginc"
			#include "UnityStandardUtils.cginc"
			//#include "vr_zAO.cginc"
			//#pragma multi_compile _ Z_SHAPEAO
			#include "vr_utils.cginc"
			//#include "UnityStandardUtils.cginc"
			//#include "vr_StandardInput.cginc"
			//#include "vr_lighting.cginc"
			//#include "vr_fog.cginc"
			#pragma multi_compile _ D_VALVE_SHADOWING_POINT_LIGHTS
			#pragma shader_feature D_CASTSHADOW
			#pragma shader_feature S_RECEIVE_SHADOWS
			#include "vr_matrix_palette_skinning.cginc"
			#pragma multi_compile_fwdbase

			#define VALVE_VR_LIGHTING_INCLUDED

			#define MAX_LIGHTS 18
		CBUFFER_START( ValveVrLighting )
			int g_nNumLights;
			bool g_bIndirectLightmaps = false;


			float4 g_vLightColor[ MAX_LIGHTS ];
			float4 g_vLightPosition_flInvRadius[ MAX_LIGHTS ];
			float4 g_vLightDirection[ MAX_LIGHTS ]; //Direction with, w = cookie Number
			float4 g_vLightShadowIndex_vLightParams[ MAX_LIGHTS ]; // x = Shadow index, y = Light cookie index, z = Diffuse enabled, w = Specular enabled
			float4 g_vLightFalloffParams[ MAX_LIGHTS ]; // x = Linear falloff, y = Quadratic falloff, z = Radius squared for culling  , w = lambert wrap
			float4 g_vSpotLightInnerOuterConeCosines[ MAX_LIGHTS ]; // w = 1 is point light

			float4 g_vShadowMinMaxUv[ MAX_LIGHTS ];
			float4x4 g_matWorldToShadow[ MAX_LIGHTS ];
			float4 g_vShadow3x3PCFTerms0;
			float4 g_vShadow3x3PCFTerms1;
			float4 g_vShadow3x3PCFTerms2;
			float4 g_vShadow3x3PCFTerms3;
			float4 g_vShadowUniTerms;

			float4x4 g_matWorldToLightCookie[ MAX_LIGHTS ];

			float4x4 g_matWorldToPoint[ MAX_LIGHTS ];

			uniform float _BumpScale;
			uniform float _OcclusionStrength;
			uniform sampler2D _BumpMap;
			uniform sampler2D _OcclusionMap;
			uniform float _NormalToOcclusion;
			uniform float _Intensity;
		//	uniform float _IndirectMultiplier;


		CBUFFER_END


			struct appdata
			{
				float4 vPositionOs : POSITION;
				float3 vNormalOs : NORMAL;
				float2 vTexCoord0 : TEXCOORD0;	
				float4 vTangentUOs_flTangentVSign : TANGENT;			


				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};
			
			struct v2f
			{
				float4 vPositionPs : SV_POSITION;
				float3 vPositionWs : TEXCOORD0;
				float3 vNormalWs : TEXCOORD1;		
				float2 vTextureCoords : TEXCOORD2;
				float3 vTangentUWs : TEXCOORD4;
				float3 vTangentVWs : TEXCOORD5;

				
				UNITY_VERTEX_OUTPUT_STEREO
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
#define VALVE_DECLARE_SHADOWMAP( tex ) Texture2D tex; SamplerComparisonState sampler##tex
#define VALVE_SAMPLE_SHADOW( tex, coord ) tex.SampleCmpLevelZero( sampler##tex, (coord).xy, (coord).z )

VALVE_DECLARE_SHADOWMAP( g_tShadowBuffer );

float2 ClampShadowUv( float2 vUv, float4 vShadowMinMaxUv )
{
	#if ( D_VALVE_SHADOWING_POINT_LIGHTS )
	{
		vUv.xy = max( vUv.xy, vShadowMinMaxUv.xy );
		vUv.xy = min( vUv.xy, vShadowMinMaxUv.zw );
	}
	#endif
	return vUv.xy;
}

float ComputeShadow_PCF_3x3_Gaussian( float3 vPositionWs, float4x4 matWorldToShadow, float4 vShadowMinMaxUv )
{
	float4 vPositionTextureSpace = mul( float4( vPositionWs.xyz, 1.0 ), matWorldToShadow );
	vPositionTextureSpace.xyz /= vPositionTextureSpace.w;

	float2 shadowMapCenter = vPositionTextureSpace.xy;

	//if ( ( frac( shadowMapCenter.x ) != shadowMapCenter.x ) || ( frac( shadowMapCenter.y ) != shadowMapCenter.y ) )
	if ( ( shadowMapCenter.x < 0.0f ) || ( shadowMapCenter.x > 1.0f ) || ( shadowMapCenter.y < 0.0f ) || ( shadowMapCenter.y > 1.0f ) )
		return 1.0f;

	float objDepth = 1 - ( vPositionTextureSpace.z );

	//Simple Bilinear texture filtering
	if(g_vShadowUniTerms.x == 1){
		
	float shadow = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy, vShadowMinMaxUv ), objDepth ) ).x;
	return shadow;
	}	
	//if (g_vShadowUniTerms.x == 2){
	{
	float4 v20Taps;
	v20Taps.x = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms1.xy, vShadowMinMaxUv ), objDepth ) ).x; //  1  1
	v20Taps.y = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms1.zy, vShadowMinMaxUv ), objDepth ) ).x; // -1  1
	v20Taps.z = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms1.xw, vShadowMinMaxUv ), objDepth ) ).x; //  1 -1
	v20Taps.w = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms1.zw, vShadowMinMaxUv ), objDepth ) ).x; // -1 -1
	float flSum = dot( v20Taps.xyzw, float4( 0.25, 0.25, 0.25, 0.25 ) );
	if ( ( flSum == 0.0 ) || ( flSum == 1.0 ) )
		return flSum;
	flSum *= g_vShadow3x3PCFTerms0.x * 4.0;

	float4 v33Taps;
	v33Taps.x = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms2.xz, vShadowMinMaxUv ), objDepth ) ).x; //  1  0
	v33Taps.y = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms3.xz, vShadowMinMaxUv ), objDepth ) ).x; // -1  0
	v33Taps.z = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms3.zy, vShadowMinMaxUv ), objDepth ) ).x; //  0 -1
	v33Taps.w = VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy + g_vShadow3x3PCFTerms2.zy, vShadowMinMaxUv ), objDepth ) ).x; //  0  1
	flSum += dot( v33Taps.xyzw, g_vShadow3x3PCFTerms0.yyyy );

	flSum += VALVE_SAMPLE_SHADOW( g_tShadowBuffer, float3( ClampShadowUv( shadowMapCenter.xy, vShadowMinMaxUv ), objDepth ) ).x * g_vShadow3x3PCFTerms0.z;
	
	return flSum;
	}

}

	////Custom compute lighting to return only added normal lighting
	

float3 ComputeLighting( float3 vPositionWs, float3 vNormalWs, float3 vNormalTs )
{


	float3 vDiffuse = float3( 0.0, 0.0, 0.0);
	float3 vIndirectDiffuse = float3( 0.0, 0.0, 0.0 );

	float3 vPositionToCameraDirWs = CalculatePositionToCameraDirWs( vPositionWs.xyz );


	//-------------------------------------//
	// Point, spot, and directional lights //
	//-------------------------------------//
	int nNumLightsUsed = 0;
	[ loop ] for ( int i = 0; i < g_nNumLights; i++ )
	{

		float3 vPositionToLightRayWs = g_vLightPosition_flInvRadius[ i ].xyz - vPositionWs.xyz;
		float flDistToLightSq = dot( vPositionToLightRayWs.xyz, vPositionToLightRayWs.xyz );
		if ( flDistToLightSq > g_vLightFalloffParams[ i ].z ) // .z stores radius squared of light
		{
			// Outside light range
			continue;
		}
		
		float3 vPositionToLightDirWs = normalize( vPositionToLightRayWs.xyz );
		float flOuterConeCos = g_vSpotLightInnerOuterConeCosines[ i ].y;
		float flTemp = dot( vPositionToLightDirWs.xyz, -g_vLightDirection[ i ].xyz ) - flOuterConeCos;
		//#if !S_ANISOTROPIC_GLOSS 
		if ( flTemp <= 0.0 )
		{
			// Outside spotlight cone
			continue;
		}
		//#endif

		float3 vSpotAtten = saturate( flTemp * g_vSpotLightInnerOuterConeCosines[ i ].z ).xxx;


		nNumLightsUsed++;

		// [branch] if ( g_vLightShadowIndex_vLightParams[ i ].y != 0 ) // If has a light cookie
		// {
		// 	// Light cookie

		// 	//	vSpotAtten.rgb = Tex3DLevel( g_tVrLightCookieTexture, vPositionTextureSpace.xyz, 0.0 ).rgb;
		// 	//	vSpotAtten.rgb = tex2D (g_tVrLightCookieTexture ,  vPositionTextureSpace.xy ) ;

		// 	if (g_vSpotLightInnerOuterConeCosines[i].w != 0)
		// 	{
		// 	//point
		// 	float4 vPositionTextureSpace = mul( float4( g_vLightPosition_flInvRadius[ i ].xyz - vPositionWs.xyz, 1.0 ), g_matWorldToLightCookie[ i ] );
		// 	vPositionTextureSpace.xyz /= distance(vPositionTextureSpace.xyz, 0);
		// 	//equirectangular Projection
		// 	vPositionTextureSpace.xy = float2(atan2(vPositionTextureSpace.z,vPositionTextureSpace.x), acos(vPositionTextureSpace.y)) / float2(UNITY_TWO_PI, M_PI) + float2(0.5,0);

		// //	vSpotAtten.rgb = UNITY_SAMPLE_TEX2DARRAY_LOD(  g_tVrLightCookieTexture, float3(vPositionTextureSpace.xy, g_vLightDirection[ i ].w ), 0  ).rgb ;
		// 	vSpotAtten.rgb = UNITY_SAMPLE_TEX2DARRAY_LOD(  g_tVrLightCookieTexture, float3(vPositionTextureSpace.xy, g_vLightDirection[ i ].w ), 0  ).rgb ;
		// 	}
		// 	if (g_vSpotLightInnerOuterConeCosines[i].w != 1)
		// 	{
		// 	//Non-point
		// 	//	vPositionTextureSpace.xyz /= vPositionTextureSpace.w;
		// 	float4 vPositionTextureSpace = mul( float4( vPositionWs.xyz, 1.0 ), g_matWorldToLightCookie[ i ] );
		// 	vPositionTextureSpace.xyz /= vPositionTextureSpace.w;
		// 	vSpotAtten.rgb = UNITY_SAMPLE_TEX2DARRAY_LOD(  g_tVrLightCookieTexture, float3(vPositionTextureSpace.xy, g_vLightDirection[ i ].w ), 0  ).rgb ;
		// 	}
			


		float flLightFalloff = 	 lerp( 1.0, ( 1.0 - pow( flDistToLightSq * g_vLightPosition_flInvRadius[ i ].w * g_vLightPosition_flInvRadius[ i ].w, 0.175 ) ), g_vLightFalloffParams[ i ].x );




		float flShadowScalar = 1.0;
		// #if S_RECEIVE_SHADOWS
		// {
			if ( g_vLightShadowIndex_vLightParams[ i ].x != 0.0 ) // If light casts shadows
			{

				#if ( D_VALVE_SHADOWING_POINT_LIGHTS )
				{
					if ( g_vLightShadowIndex_vLightParams[ i ].x == 2.0 ) // If light is a point light's fake spotlight
					{
						// Cull pixels outside the 90 degree frustum
					//	float4 vPositionTextureSpace = mul( float4( vPositionWs.xyz, 1.0 ), g_matWorldToLightCookie[ i ] );
					float4 vPositionTextureSpace = mul( float4( vPositionWs.xyz, 1.0 ), g_matWorldToPoint[ i ] );


						if ( ( vPositionTextureSpace.x < 0.0f ) || ( vPositionTextureSpace.y < 0.0f ) || ( vPositionTextureSpace.x > vPositionTextureSpace.w ) || ( vPositionTextureSpace.y > vPositionTextureSpace.w ) )
							continue;
					}
				}
				#endif

				flShadowScalar = ComputeShadow_PCF_3x3_Gaussian( vPositionWs.xyz, g_matWorldToShadow[ i ], g_vShadowMinMaxUv[ i ] );
				if ( flShadowScalar <= 0.0 )
					continue;
			}
	//	}
	//	#endif

	
		float flTnDotL = ( dot( vNormalTs.xyz, vPositionToLightDirWs.xyz ) );

		float flNDotL = clamp( smoothstep(  0, 0.5, dot( vNormalWs.xyz, vPositionToLightDirWs.xyz )) ,0 ,1)   ;

		float3 vLightColor = g_vLightColor[ i ].rgb;
//		float3 vLightMask = vLightColor.rgb * flShadowScalar * flLightFalloff * vSpotAtten.rgb;
//flLightFalloff
		float3 vLightMask =  vSpotAtten.rgb  * flNDotL * flShadowScalar;


		vDiffuse += flTnDotL.xxx * vLightMask;

	}

	//------------------//
	// Indirect diffuse //
	//------------------//

	float3 Indirectlighting = float3(0,0,0);

	#if defined( UNITY_SHOULD_SAMPLE_SH )
	{
		
		#if (UNITY_LIGHT_PROBE_PROXY_VOLUME)
		{
		
			if (unity_ProbeVolumeParams.x == 1)
				{
				Indirectlighting.rgb += (ShadeSHPerPixel(vNormalTs.xyz, Indirectlighting.rgb, vPositionWs.xyz));  // Light probe Proxy Volume 
				}
				#if (!DYNAMICLIGHTMAP_ON)
			else
				{
				Indirectlighting.rgb += (ShadeSH9( float4( vNormalTs.xyz, 0.0 ) ));  // Simple Light probe
				}
				#endif
		}
		#else
			{
			// Simple Light probe
			Indirectlighting.rgb += (ShadeSH9( float4( vNormalTs.xyz, 0.0 ) ));
			}
		#endif

	}	
	#endif




	return vDiffuse + (Indirectlighting);
}



						
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				//UNITY_TRANSFER_INSTANCE_ID(v, o);



				
				
		//		v.vPositionOs.xyz +=  float3(0,0,0) ;
				o.vPositionPs = UnityObjectToClipPos(v.vPositionOs);
				o.vNormalWs =  UnityObjectToWorldNormal( v.vNormalOs.xyz );
				o.vPositionWs = mul( unity_ObjectToWorld, v.vPositionOs.xyzw ).xyz;

				// TangentU and TangentV
				float3 vTangentUWs = UnityObjectToWorldDir( v.vTangentUOs_flTangentVSign.xyz ); // Transform tangentU into world space
				//vTangentUWs.xyz = normalize( vTangentUWs.xyz - ( vNormalWs.xyz * dot( vTangentUWs.xyz, vNormalWs.xyz ) ) ); // Force tangentU perpendicular to normal and normalize

				o.vTangentUWs.xyz = vTangentUWs.xyz;
				o.vTangentVWs.xyz = cross( o.vNormalWs.xyz, vTangentUWs.xyz ) * v.vTangentUOs_flTangentVSign.w;


				o.vTextureCoords = v.vTexCoord0;
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				fixed4 finalColor;

				//Unpack tangent Normals
				float3 vNormalTs =  UnpackScaleNormal( tex2D(_BumpMap, i.vTextureCoords), _BumpScale );
				vNormalTs.rg -= 0.0039215686; //shift to have true 
				//Compute occlusion based normals
				float2 normalABS =  abs(vNormalTs.xy * vNormalTs.xy) ;
				float flOcclusion =   lerp(1, (1 - (normalABS.x + normalABS.y) ) * (vNormalTs.z ) , _NormalToOcclusion);	

				//Add tangent to WS normals
				float3 vNormalWsBump = Vec3TsToWsNormalized( vNormalTs.xyz, i.vNormalWs.xyz, i.vTangentUWs.xyz, i.vTangentVWs.xyz  );

			//	float3 normal = i.vNormalWs - i.vNormalWs;
				float3 lighting = ComputeLighting(i.vPositionWs,  i.vNormalWs.xyz, vNormalWsBump - i.vNormalWs.xyz)  ;

				lighting = (lighting * _Intensity) + 0.5f;
				

				


#if (S_OCCLUSION)
				flOcclusion *= tex2D(_OcclusionMap, i.vTextureCoords).g;
				flOcclusion = lerp(1, flOcclusion, _OcclusionStrength);
				finalColor = float4(lighting.xyz, 1) * flOcclusion;

#elif (S_COLORSHIFT)

				flOcclusion = lerp(1, flOcclusion, _OcclusionStrength);
				float4 colorTint = tex2D(_OcclusionMap, i.vTextureCoords).rgba;
				colorTint.rgb = lerp(1,colorTint.rgb, colorTint.a);
				finalColor = float4(lighting.xyz * colorTint.rgb, 1) * flOcclusion ;
#endif

			return max(finalColor,0);
			//return float4(-5,5,-5,1);
			}
			ENDCG
		}
	}
	
	
}
