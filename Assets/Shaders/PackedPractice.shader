Shader "Holistic/PackedPractice" {
  
  Properties {
       _myColour ("Simple Colour", Color) = (1,1,1,1)
  }
  
  SubShader {
    
    CGPROGRAM
      #pragma surface surf Lambert

      struct Input {
        float2 uvMainTex;
      };

      fixed4 _myColour;
      
      void surf (Input IN, inout SurfaceOutput o){
          o.Albedo.rgb = _myColour.rgb;
      }
    
    ENDCG
  }
  
  FallBack "Diffuse"
}

