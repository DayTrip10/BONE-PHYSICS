Shader "SLZ/Capsule" {
	Properties {
		_Color ("Color", Vector) = (1,1,1,0)
	}
	SubShader {
		LOD 100
		Tags { "RenderType" = "Transparent" }
		Pass {
			Name "Unlit"
			LOD 100
			Tags { "RenderType" = "Transparent" }
			GpuProgramID 61231
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