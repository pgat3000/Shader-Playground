Shader "Holistic/NormalsEnviorementCube" 
{
    Properties {
        _Normals ("Normal Texture", 2D) = "bump" {}
        _BrightnesSlider ("Brightness Slider",Range(0.1,10))=1
        _CubeMap("Cube Map",CUBE) = "white" {}
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _Normals;
        float _DepthSlider;
        float _BrightnesSlider;
        samplerCUBE _CubeMap;

        struct Input {
            float2 uv_Normals;
            float3 worldRefl; INTERNAL_DATA
        };
        
        void surf (Input IN, inout SurfaceOutput o) {;
            o.Normal = UnpackNormal(tex2D(_Normals, IN.uv_Normals))* _BrightnesSlider;
            o.Albedo = texCUBE(_CubeMap, WorldReflectionVector(IN,o.Normal)).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
