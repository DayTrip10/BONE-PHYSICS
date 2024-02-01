Shader "Valve/VR/Silhouette" {
	Properties {
		g_vOutlineColor ("Outline Color", Vector) = (0.5,0.5,0.5,1)
		g_flOutlineWidth ("Outline width", Range(0.0001, 0.03)) = 0.005
	}
	SubShader {
		Tags { "QUEUE" = "Geometry-1" "RenderType" = "Outline" }
		Pass {
			Tags { "LIGHTMODE" = "ALWAYS" "QUEUE" = "Geometry-1" "RenderType" = "Outline" }
			ColorMask 0 -1
			ZWrite Off
			Cull Off
			Stencil {
				Ref 1
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}
			GpuProgramID 60355
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
		Pass {
			Tags { "LIGHTMODE" = "ALWAYS" "QUEUE" = "Geometry-1" "RenderType" = "Outline" }
			Cull Off
			Stencil {
				Ref 1
				Comp NotEqual
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			GpuProgramID 122656
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"vs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_5_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
			Program "gp" {
				SubProgram "d3d11 " {
					"gs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_CUBEMAP_RENDER_ON" }
					"gs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" }
					"gs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"gs_5_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
	}
}