Shader "Custom/Test" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
	_Interval("Interval", Range(0,100)) = 10
		_Speed("Speed", Range(0,100)) = 10
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		CGPROGRAM
#pragma surface surf Lambert vertex:vert

	struct Input {
		float2 uv_MainTex;
	};

	float _Interval, _Speed;
	void vert(inout appdata_full v) {
		float wPos = mul(unity_ObjectToWorld, v.vertex);

		v.vertex.xyz += v.normal * ((floor(_Time[1] * _Speed) * wPos) % _Interval);
	}

	sampler2D _MainTex;
	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
	}

	ENDCG
	}
		Fallback "Diffuse"
}

