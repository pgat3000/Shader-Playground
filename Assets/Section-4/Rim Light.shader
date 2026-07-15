Shader "Holistic/RimLight"
{
	Properties
	{
	_RimColor("Rim Color", Color) = (0,0.5,0.5,0)
	_RimPower("Rim Power", Range(0.5,8)) = 3

	}

		SubShader
	{
		Tags { "RenderType" = "Opaque" }


		CGPROGRAM

		#pragma surface surf Lambert

		struct Input
		{
			float3 viewDir;
		};

		float4   _RimColor;
		float   _RimPower;

		void surf(Input IN, inout SurfaceOutput o)
		{
			float rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = _RimColor.rgb * pow(rim, _RimPower); //Exponential change
		}
		ENDCG
	}
		FallBack "Diffuse"
}
