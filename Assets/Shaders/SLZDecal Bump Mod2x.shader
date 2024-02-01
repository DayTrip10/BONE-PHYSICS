Shader "SLZ/Decal Bump Mod2x" {
	Properties {
		[NoScaleOffset] [Normal] _BumpMap ("Normal Map", 2D) = "bump" {}
		_BumpScale ("Bump Scale", Float) = 1
		[KeywordEnum(Occlusion, Colorshift)] S ("Texture mode", Float) = 0
		[NoScaleOffset] _OcclusionMap ("Texture Map", 2D) = "white" {}
		_OcclusionStrength ("Occlusion Strength", Range(0, 1)) = 1
		_NormalToOcclusion ("Normal To Occlusion", Range(0, 2)) = 1
		_Intensity ("Intensity", Float) = 1
		_OffsetFactor ("Offset Factor", Float) = -1
		_OffsetUnits ("Offset Units", Float) = -1
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Geometry+700" "RenderType" = "Custom" }
		Pass {
			Name "Forward"
			LOD 100
			Tags { "LIGHTMODE" = "FORWARDBASE" "PASSFLAGS" = "OnlyDirectional" "QUEUE" = "Geometry+700" "RenderType" = "Custom" "SHADOWSUPPORT" = "true" }
			Blend DstColor SrcColor, DstColor SrcColor
			ZWrite Off
			GpuProgramID 59532
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "VERTEXLIGHT_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_OCCLUSION" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "LIGHTPROBE_SH" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_ON" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" "S_RECEIVE_SHADOWS" "S_COLORSHIFT" "D_VALVE_SHADOWING_POINT_LIGHTS" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
	}
}