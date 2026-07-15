Shader "Holistic/DotProduct"
{
    Properties
    {}

    SubShader
    {
        Tags { "RenderType" = "Opaque" }


        CGPROGRAM

        #pragma surface surf Lambert

        struct Input
        {
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            float dotProduct = 1 - dot(IN.viewDir, o.Normal);
            o.Albedo.rgb = float3(dotProduct, 1,1); //Rim light in blueish
        }
        ENDCG
    }
    FallBack "Diffuse"
}
