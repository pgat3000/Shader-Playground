Shader "Holistic/RimLightCutOff"
{
	Properties
	{
	DmyTex("Diffuse Texture", 2D) = "white" {}
	_RimColor("Rim Color", Color) = (0,0.5,0.5,0)
	_RimPower("Rim Power", Range(0.5,8)) = 3
	_StripeLenght("Stripe Lenght", Range(0.5,20)) = 3

	}

		SubShader
	{
		Tags { "RenderType" = "Opaque" }


		CGPROGRAM

		#pragma surface surf Lambert

		struct Input
		{
			float3 viewDir;
			float3 worldPos;
			float2 uvDmyTex;
		};

		float4   _RimColor;
		float   _RimPower;
		float   _StripeLenght;
		sampler2D DmyTex;

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = (tex2D(DmyTex, IN.uvDmyTex)).rgb;
			float rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = frac(IN.worldPos.y * (20-_StripeLenght) * 0.5) > 0.4 ? float3(0, 1, 0) * pow(rim, _RimPower)
				: float3(1, 0, 0) * pow(rim, _RimPower);
		}
		ENDCG
	}
		FallBack "Diffuse"
}
