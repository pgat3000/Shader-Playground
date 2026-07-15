Shader "Holistic/Normals" 
{
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Normals ("Normals", 2D) = "bump" {}
        _DepthSlider ("Normal Depth",Range(0,10))=1
        _ScaleSlider ("Scale Slider",Range(0.5,2))=1
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _Diffuse;
        sampler2D _Normals;
        float _DepthSlider;
        float _ScaleSlider;

        struct Input {
            float2 uv_Diffuse;
            float2 uv_Normals;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = (tex2D(_Diffuse , IN.uv_Diffuse * _ScaleSlider) ).rgb ;
            o.Normal = UnpackNormal(tex2D(_Normals, IN.uv_Normals * _ScaleSlider));
            o.Normal *= float3(_DepthSlider, _DepthSlider, 1);
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
