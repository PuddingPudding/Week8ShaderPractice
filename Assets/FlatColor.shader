﻿Shader "unityCookie/tut/beginner/1 - Flat Color" 
{
	//Interface
	Properties
	{
		_Color("Color", Color) = (1.0,1.0,1.0,1.0)
		_WaveValue("WaveValue",Range(0,1)) = 0.3
		_WaveDensity("WaveDensity",Range(1,30)) = 15
		_TimeCounter("TimeCounter",range(0,6.3)) = 0

	}

		SubShader
		{
			Pass
			{
				CGPROGRAM
				//pragmas
				#pragma vertex vert
				#pragma fragment frag

				//user defined variables
				uniform float4 _Color;
				uniform float _WaveValue;
				uniform float _WaveDensity;
				uniform float _TimeCounter;

				//base input structs
				struct vertexInput
				{
					float4 vertex : POSITION;
				};
				struct vertexOutput
				{
					float4 pos : SV_POSITION;
				};

				//vertex function
				vertexOutput vert(vertexInput v)
				{
					vertexOutput o;
					o.pos = mul(UNITY_MATRIX_MVP, v.vertex);

					o.pos.x = o.pos.x + sin((o.pos.y) * _WaveDensity + _TimeCounter) * _WaveValue;

					return o;
				}

				//fragment function
				float4 frag(vertexOutput i) : COLOR
				{
					return _Color;
				}

					ENDCG
			}
		}
		//fallback commented out during development
		//Fallback "Diffuse"
}
