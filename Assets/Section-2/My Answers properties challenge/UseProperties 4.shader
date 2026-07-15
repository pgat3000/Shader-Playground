Shader "Holistic/AllProps4" 
{
    Properties {
        DmyTex ("Diffuse Texture", 2D) = "white" {}
        EmyTex ("Emission Texture", 2D) = "black" {}
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D DmyTex;
        sampler2D EmyTex;


        struct Input {
            float2 uvEmyTex;// you only need to add  "uv"
            float2 uvDmyTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo= (tex2D(DmyTex, IN.uvDmyTex)).rgb;
            o.Emission= (tex2D(EmyTex, IN.uvEmyTex)).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
