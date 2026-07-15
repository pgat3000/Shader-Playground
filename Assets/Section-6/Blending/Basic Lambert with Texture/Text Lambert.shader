Shader "Holistic/TexLambert"
{
	Properties
	{
		_MainTex("Main", 2D) = "white"{}
	}
		SubShader
	{
		Tags { "Queue" = "Geometry" }

		CGPROGRAM

		#pragma surface surf BasicL

		 half4 LightingBasicL(SurfaceOutput s, half3 lightDir, half atten) {
			  half NdotL = dot(s.Normal, lightDir);
			  half4 c;
			  c.rgb = s.Albedo * (NdotL * atten);
			  c.a = s.Alpha;
			  return c;
		  }

		sampler2D _MainTex;
		float4 _Color;

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}
		ENDCG
	}
		FallBack "Diffuse"
}
