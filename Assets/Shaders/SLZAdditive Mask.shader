Shader "SLZ/Additive Mask" {
	Properties {
		_EmissionMap ("EmissionMap", 2D) = "white" {}
		[HDR] _EmissionColor ("EmissionColor", Vector) = (1,1,1,1)
		_TextureMask ("TextureMask", 2D) = "white" {}
		_OffsetFactor ("Offset Factor", Float) = 0
		_OffsetUnits ("Offset Units", Float) = 0
		[HideInInspector] _texcoord ("", 2D) = "white" {}
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "Unlit"
			LOD 100
			Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One One, One One
			ZWrite Off
			GpuProgramID 9926
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
					Keywords { "INSTANCING_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" }
					"vs_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
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
					Keywords { "INSTANCING_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
				SubProgram "d3d11 " {
					Keywords { "INSTANCING_ON" "STEREO_INSTANCING_ON" "STEREO_CUBEMAP_RENDER_ON" }
					"ps_4_0
					/*Can't export program data d3d11 as a text*/"
				}
			}
		}
	}
	CustomEditor "ASEMaterialInspector"
}