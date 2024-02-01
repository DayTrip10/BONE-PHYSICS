Shader "SLZ/Particle Motion Vector" {
	Properties {
		[NoScaleOffset] _MainTex ("Main Texture", 2D) = "white" {}
		[NoScaleOffset] _MotionVectors ("Motion Vectors", 2D) = "white" {}
		_UVMotionMultiplier ("UV Motion Multiplier", Float) = 0
		_Color ("Color", Vector) = (1,1,1,1)
		_DepthBlend ("Depth Blend", Float) = 0.5
		_ShadowBlend ("Shadow Blend", Float) = 0.2
		_ColorDitherPercent ("Color Dithering Percentage", Range(0, 1)) = 0.03
		[Space(20)] [Header(General Properties)] [KeywordEnum( Specular_Metallic, Anisotropic_Gloss, Retroreflective )] S ("Specular mode", Float) = 0
		g_flFresnelFalloff ("Fresnel Falloff Scalar", Range(0, 10)) = 1
		g_flFresnelExponent ("Fresnel Exponent", Range(0.5, 10)) = 5
		[Space(5)] [Toggle( _BRDFMAP )] EnableBRDFMAP ("Enable BRDF remap", Float) = 0
		[NoScaleOffset] g_tBRDFMap ("BRDF LUT", 2D) = "grey" {}
		[Space(10)] [Header(Override Properties)] g_flCubeMapScalar ("Cube Map Scalar", Range(0, 2)) = 1
		[Toggle( S_RECEIVE_SHADOWS )] ReceiveShadows ("Receive Shadows", Float) = 1
		[Toggle( _FLUORESCENCEMAP )] Fluorescence ("Enable Fluorescence", Float) = 0
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "VRBase"
			LOD 100
			Tags { "LIGHTMODE" = "FORWARDBASE" "PASSFLAGS" = "OnlyDirectional" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			GpuProgramID 39432
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_BRDFMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
		Pass {
			Name "META"
			LOD 100
			Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 94030
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_DETAIL_MULX2" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "_DETAIL_MULX2" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "_DETAIL_MULX2" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "_DETAIL_MULX2" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_DETAIL_MULX2" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "_DETAIL_MULX2" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "_DETAIL_MULX2" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "_DETAIL_MULX2" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
	}
}