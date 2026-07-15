Shader "Holistic/NormalsEnviorement" 
{
    Properties {
        _Diffuse ("Diffuse Texture", 2D) = "white" {}
        _Normals ("Normal Texture", 2D) = "bump" {}
        _DepthSlider ("Normal Depth",Range(0,10))=1
        _BrightnesSlider ("Brightness Slider",Range(0.1,10))=1
        _CubeMap("Cube Map",CUBE) = "white" {}
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _Diffuse;
        sampler2D _Normals;
        float _DepthSlider;
        float _BrightnesSlider;
        samplerCUBE _CubeMap;

        struct Input {
            float2 uv_Diffuse;
            float2 uv_Normals;
            float3 worldRefl; INTERNAL_DATA
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
           o.Albedo = (tex2D(_Diffuse , IN.uv_Diffuse)).rgb ;
            o.Normal = UnpackNormal(tex2D(_Normals, IN.uv_Normals)) * _BrightnesSlider;
            o.Normal *= float3(_DepthSlider, _DepthSlider, 1);
            o.Emission = texCUBE(_CubeMap, WorldReflectionVector(IN,o.Normal)).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
