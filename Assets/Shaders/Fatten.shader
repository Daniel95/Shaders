Shader "Custom/Fatten" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
		_FattenAmount("FattenAmount", Range(0,20)) = 1
		_Speed("Speed", Range(0,20)) = 1
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		CGPROGRAM
#pragma surface surf Lambert vertex:vert

	struct Input {
		float2 uv_MainTex;
	};

	float _FattenAmount, _Speed;
	void vert(inout appdata_full v) {
		v.vertex.xyz += v.normal * (abs(sin(_Time.w * _Speed)) * _FattenAmount);
	}

	sampler2D _MainTex;
	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
	}

	ENDCG
	}
		Fallback "Diffuse"
}
