Shader "SLZ/Lines/Colored Blended" {
	SubShader{
		Pass{
		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite Off
		ZTest Off
		Cull Off

		Fog{
		Mode Off
	}

		BindChannels{
		Bind "vertex",
		vertex Bind "color",
		color
	}
	}
	}
}