Shader "SLZ/Scanline" {
	Properties {
		[NoScaleOffset] _EmissionMap ("Emission Map", 2D) = "white" {}
		_MainTex ("MainTex", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		[HDR] _EmissionColor ("Emission Color", Vector) = (0,0,0,0)
		_Glossiness ("Glossiness", Range(0, 1)) = 0
		_Metallic ("Metallic", Range(0, 1)) = 0
		[Toggle] S_EMISSIVE_MULTI ("Emissive Multiplication", Float) = 0
		_EmissionFalloff ("Emission Falloff", Range(0, 5)) = 1
		_ScanlineSpeed ("Scanline Speed", Float) = 0.1
		_ScanlineIntensity ("Scanline Intensity", Range(0, 1)) = 0.5
		_ScanlineCount ("Scanline Count", Float) = 32
		_Pixels ("Pixels", 2D) = "white" {}
		_Fluorescence ("Fluorescence", Vector) = (0.4083748,0.5377358,0.4464222,1)
		_Absorbance ("Absorbance", Vector) = (0.042,0.112,0.517,1)
		[HideInInspector] _texcoord ("", 2D) = "white" {}
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
		Tags { "RenderType" = "Opaque" }
		Pass {
			Name "VRBase"
			LOD 100
			Tags { "LIGHTMODE" = "FORWARDBASE" "PASSFLAGS" = "OnlyDirectional" "RenderType" = "Opaque" }
			GpuProgramID 44946
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_SPECULAR_METALLIC" "Z_SHAPEAO" "D_VALVE_FOG" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_ANISOTROPIC_GLOSS" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "DIRLIGHTMAP_SEPARATE" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "DYNAMICLIGHTMAP_OFF" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "Z_SHAPEAO" "D_VALVE_FOG" "S_RETROREFLECTIVE" "_FLUORESCENCEMAP" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
		Pass {
			Name "META"
			LOD 100
			Tags { "LIGHTMODE" = "META" "RenderType" = "Opaque" }
			Cull Off
			GpuProgramID 74897
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
					Keywords { "_EMISSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_EMISSION" "STEREO_CUBEMAP_RENDER_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_EMISSION" "STEREO_INSTANCING_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_EMISSION" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
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
					Keywords { "_EMISSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_EMISSION" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_EMISSION" "STEREO_INSTANCING_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "_EMISSION" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
	}
	CustomEditor "ASEMaterialInspector"
}