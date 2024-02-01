Shader "SLZ/Vignette" {
	Properties {
		[Header(Vignette Settings)] _Inner ("Inner", Range(0, 1)) = 1
		_Outter ("Outter", Range(0, 1)) = 0
		_Color ("Color", Vector) = (1,0,0,0)
		_Brighten ("Brighten", Range(0, 1)) = 0
		_ShutEyes ("Shut Eyes", Range(0, 1)) = 0
		[NoScaleOffset] _EyeTexture ("EyeTexture", 2D) = "gray" {}
	}
	SubShader {
		LOD 100
		Tags { "QUEUE" = "Overlay" "RenderType" = "Overlay" }
		Pass {
			Name "Unlit"
			LOD 100
			Tags { "QUEUE" = "Overlay" "RenderType" = "Overlay" }
			Blend DstColor SrcColor, DstColor SrcColor
			ZTest Always
			ZWrite Off
			GpuProgramID 5992
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
			}
		}
	}
	CustomEditor "ASEMaterialInspector"
}