Shader "Holistic/TestSurfaceShader" {

	Properties{
		 _myColour("Simple Colour", Color) = (1,1,1,1)
		 _myEmission("Simple Emision", Color) = (1,1,1,1)
		 _myNormal("Simple Normal", Color) = (1,1,1,1)
	}

		SubShader{

			CGPROGRAM
				#pragma surface surf Lambert

				struct Input {
					float2 uvMainTex;
				};

				float4 _myColour;
				fixed4 _myEmission;
				fixed4 _myNormal;

				void surf(Input IN, inout SurfaceOutput o) {
					o.Albedo = _myColour.rgb;
					o.Emission = _myEmission.rgb;
					o.Normal = _myNormal.rgb;
				}

			ENDCG
	}

		FallBack "Diffuse"
}
