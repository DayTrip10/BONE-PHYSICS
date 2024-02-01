Shader /*ase_name*/ "Hidden/Templates/VRDefaultUnlit" /*end*/
{
	Properties
	{
		_MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Color) = (1,1,1,1)
		/*ase_props*/
	}
	
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100
		Cull Off

		/*ase_pass*/
		Pass
		{
			CGPROGRAM
			#pragma target 3.0 
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			/*ase_pragma*/

			struct appdata //VS INPUT
			{
				float4 vPositionOs : POSITION;
				float4 vTangentUOs_flTangentVSign : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 texcoord3 : TEXCOORD3;				
				fixed4 color : COLOR;				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			/*ase_vdata:p=p;t=t;n=n;uv0=tc0.xyzw;uv1=tc1.xyzw;uv2=tc2.xyzw;uv3=tc3.xyzw;c=c*/
			}; 	
			
			struct v2f
			{
				float4 vPositionPs : SV_POSITION;
				float3 vPositionWs : TEXCOORD0;
				float3 vNormalWs : TEXCOORD1;
				float3 vTangentUWs : TEXCOORD4;
				float3 vTangentVWs : TEXCOORD5;
				float2 vFogCoords : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				/*ase_interp(1,):sp=sp.xyzw;uv0=tc0.xyz;uv1=tc0.zw;wn=tc1;wt=tc4;wbt=tc5;uv2=tc6*/
			};

			uniform sampler2D _MainTex;
			uniform fixed4 _Color;
			/*ase_globals*/
			
			v2f vert ( appdata v /*ase_vert_input*/)
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);


				float3 vPositionWs = mul( unity_ObjectToWorld, v.vPositionOs.xyzw ).xyz;

				o.vPositionWs = vPositionWs;

				
				// ase common template code
				/*ase_vert_code:v=appdata;o=v2f*/
				
				v.vPositionOs.xyz += /*ase_vert_out:Local Vertex;Float3*/ float3(0,0,0) /*end*/;
				o.vPositionPs = UnityObjectToClipPos(v.vPositionOs);
				return o;
			}
			
			fixed4 frag (v2f i /*ase_frag_input*/) : SV_Target
			{
				fixed4 myColorVar;
				// ase common template code
				/*ase_frag_code:i=v2f*/
				
				myColorVar = /*ase_frag_out:Frag Color;Float4*/fixed4(1,0,0,1)/*end*/;
				return myColorVar;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
}
