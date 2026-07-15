Shader "Holistic/BlendTestShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "black" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        Blend DstColor Zero
        Pass {
            SetTexture [_MainTex] { combine texture }
            }
    }
    FallBack "Diffuse"
}
