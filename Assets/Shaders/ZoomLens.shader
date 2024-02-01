// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33843,y:32517,varname:node_3138,prsc:2|custl-5565-OUT;n:type:ShaderForge.SFN_Tex2d,id:9832,x:32964,y:32849,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-974-OUT;n:type:ShaderForge.SFN_TexCoord,id:2924,x:31814,y:32715,varname:node_2924,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Parallax,id:4679,x:32027,y:32843,varname:node_4679,prsc:2|UVIN-2924-UVOUT,HEI-2412-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1819,x:31649,y:32902,ptovrint:False,ptlb:depth,ptin:_depth,varname:_depth,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Add,id:2858,x:32219,y:32791,varname:node_2858,prsc:2|A-4679-UVOUT,B-7449-OUT;n:type:ShaderForge.SFN_Vector1,id:7449,x:32027,y:33022,varname:node_7449,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_Subtract,id:974,x:32671,y:32793,varname:node_974,prsc:2|A-9526-OUT,B-7449-OUT;n:type:ShaderForge.SFN_Divide,id:9526,x:32462,y:32793,varname:node_9526,prsc:2|A-2858-OUT,B-1227-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1227,x:32204,y:32999,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:_Scale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_OneMinus,id:2412,x:31830,y:32869,varname:node_2412,prsc:2|IN-1819-OUT;n:type:ShaderForge.SFN_Multiply,id:5565,x:33275,y:32685,varname:node_5565,prsc:2|A-7237-RGB,B-9832-RGB,C-3099-OUT;n:type:ShaderForge.SFN_Tex2d,id:7237,x:32964,y:32616,ptovrint:False,ptlb:ScopeTex,ptin:_ScopeTex,varname:_ScopeTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-974-OUT;n:type:ShaderForge.SFN_Fresnel,id:869,x:32860,y:33169,varname:node_869,prsc:2|EXP-4294-OUT;n:type:ShaderForge.SFN_Vector1,id:7017,x:32681,y:33124,varname:node_7017,prsc:2,v1:0.65;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2099,x:33128,y:33175,varname:node_2099,prsc:2|IN-869-OUT,IMIN-8217-OUT,IMAX-6233-OUT,OMIN-794-OUT,OMAX-9176-OUT;n:type:ShaderForge.SFN_Vector1,id:8217,x:32855,y:33298,varname:node_8217,prsc:2,v1:0.02;n:type:ShaderForge.SFN_Vector1,id:6233,x:32855,y:33400,varname:node_6233,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:794,x:32855,y:33476,varname:node_794,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9176,x:32855,y:33589,varname:node_9176,prsc:2,v1:0;n:type:ShaderForge.SFN_Clamp01,id:3099,x:33365,y:33051,varname:node_3099,prsc:2|IN-2099-OUT;n:type:ShaderForge.SFN_Slider,id:4294,x:32549,y:33234,ptovrint:False,ptlb:Falloff,ptin:_Falloff,varname:_Falloff,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1.5;proporder:9832-1819-1227-7237-4294;pass:END;sub:END;*/

Shader "SLZ/ZoomLens" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _depth ("depth", Float ) = 2
        _Scale ("Scale", Float ) = 2
        _ScopeTex ("ScopeTex", 2D) = "white" {}
        _Falloff ("Falloff", Range(0, 1.5)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _depth;
            uniform float _Scale;
            uniform sampler2D _ScopeTex; uniform float4 _ScopeTex_ST;
            uniform float _Falloff;
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO                
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_INITIALIZE_OUTPUT(VertexOutput, o);
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v,o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);                
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID(i);
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float node_7449 = (-0.5);
                float2 node_974 = ((((0.05*((1.0 - _depth) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0).rg+node_7449)/_Scale)-node_7449);
                float4 _ScopeTex_var = tex2D(_ScopeTex,TRANSFORM_TEX(node_974, _ScopeTex));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_974, _MainTex));
                float node_8217 = 0.02;
                float node_794 = 1.0;
                float3 finalColor = (_ScopeTex_var.rgb*_MainTex_var.rgb*saturate((node_794 + ( (pow(1.0-max(0,dot(normalDirection, viewDirection)),_Falloff) - node_8217) * (0.0 - node_794) ) / (0.1 - node_8217))));
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
