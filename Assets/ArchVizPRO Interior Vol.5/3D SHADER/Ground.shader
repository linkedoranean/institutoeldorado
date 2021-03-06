// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "AVP/Ground"
{
	Properties
	{
		_Albedo1("Albedo1", 2D) = "white" {}
		_Color0("Color 0", Color) = (0,0,0,0)
		_Albedo2("Albedo2", 2D) = "white" {}
		_Albedo3("Albedo3", 2D) = "white" {}
		_Normal1("Normal1", 2D) = "bump" {}
		_Normal2("Normal2", 2D) = "bump" {}
		_Normal3("Normal3", 2D) = "bump" {}
		_Float0("Float 0", Range( 0 , 4)) = 1
		_COLOR("COLOR", 2D) = "white" {}
		_Normal_Global("Normal_Global", 2D) = "bump" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		ZTest LEqual
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 2.0
		#pragma exclude_renderers xbox360 xboxone ps4 psp2 n3ds wiiu 
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Float0;
		uniform sampler2D _Normal1;
		uniform float4 _Normal1_ST;
		uniform sampler2D _Normal2;
		uniform float4 _Normal2_ST;
		uniform sampler2D _COLOR;
		uniform float4 _COLOR_ST;
		uniform sampler2D _Normal3;
		uniform float4 _Normal3_ST;
		uniform sampler2D _Normal_Global;
		uniform float4 _Normal_Global_ST;
		uniform sampler2D _Albedo1;
		uniform float4 _Albedo1_ST;
		uniform float4 _Color0;
		uniform sampler2D _Albedo2;
		uniform float4 _Albedo2_ST;
		uniform sampler2D _Albedo3;
		uniform float4 _Albedo3_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normal1 = i.uv_texcoord * _Normal1_ST.xy + _Normal1_ST.zw;
			float2 uv_Normal2 = i.uv_texcoord * _Normal2_ST.xy + _Normal2_ST.zw;
			float2 uv_COLOR = i.uv_texcoord * _COLOR_ST.xy + _COLOR_ST.zw;
			float4 tex2DNode13 = tex2D( _COLOR, uv_COLOR );
			float3 lerpResult19 = lerp( UnpackScaleNormal( tex2D( _Normal1, uv_Normal1 ) ,_Float0 ) , UnpackScaleNormal( tex2D( _Normal2, uv_Normal2 ) ,_Float0 ) , tex2DNode13.r);
			float2 uv_Normal3 = i.uv_texcoord * _Normal3_ST.xy + _Normal3_ST.zw;
			float3 lerpResult20 = lerp( lerpResult19 , UnpackScaleNormal( tex2D( _Normal3, uv_Normal3 ) ,_Float0 ) , tex2DNode13.g);
			float2 uv_Normal_Global = i.uv_texcoord * _Normal_Global_ST.xy + _Normal_Global_ST.zw;
			o.Normal = BlendNormals( lerpResult20 , UnpackNormal( tex2D( _Normal_Global, uv_Normal_Global ) ) );
			float2 uv_Albedo1 = i.uv_texcoord * _Albedo1_ST.xy + _Albedo1_ST.zw;
			float4 tex2DNode1 = tex2D( _Albedo1, uv_Albedo1 );
			float2 uv_Albedo2 = i.uv_texcoord * _Albedo2_ST.xy + _Albedo2_ST.zw;
			float4 tex2DNode10 = tex2D( _Albedo2, uv_Albedo2 );
			float4 lerpResult12 = lerp( tex2DNode1 , ( _Color0 * tex2DNode10 ) , tex2DNode13.r);
			float2 uv_Albedo3 = i.uv_texcoord * _Albedo3_ST.xy + _Albedo3_ST.zw;
			float4 tex2DNode11 = tex2D( _Albedo3, uv_Albedo3 );
			float4 lerpResult14 = lerp( lerpResult12 , tex2DNode11 , tex2DNode13.g);
			o.Albedo = lerpResult14.rgb;
			o.Metallic = float4(0,0,0,0).r;
			float lerpResult27 = lerp( tex2DNode1.a , tex2DNode10.a , tex2DNode13.r);
			float lerpResult26 = lerp( lerpResult27 , tex2DNode11.a , tex2DNode13.g);
			o.Smoothness = lerpResult26;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14401
7;29;1906;1004;2203.187;919.4881;2.2;True;True
Node;AmplifyShaderEditor.RangedFloatNode;38;-1202.669,438.494;Float;False;Property;_Float0;Float 0;7;0;Create;True;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-786.2002,277.7001;Float;True;Property;_Normal1;Normal1;4;0;Create;True;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;15;-782.1989,493.999;Float;True;Property;_Normal2;Normal2;5;0;Create;True;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;37;-720.3506,-353.9029;Float;False;Property;_Color0;Color 0;1;0;Create;True;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-1200.598,51.39929;Float;True;Property;_COLOR;COLOR;8;0;Create;True;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;10;-804.7979,-183.0006;Float;True;Property;_Albedo2;Albedo2;2;0;Create;True;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;16;-456.2995,273.8994;Float;True;Property;_Normal3;Normal3;6;0;Create;True;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;19;-350.9991,494.7993;Float;False;3;0;FLOAT3;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0.0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-457.1507,-252.1028;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0.0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-814.4002,-564.1993;Float;True;Property;_Albedo1;Albedo1;0;0;Create;True;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;12;-176.9978,-278.4009;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0.0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;20;-153.8993,493.0992;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0.0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;11;-479.5979,-565.6003;Float;True;Property;_Albedo3;Albedo3;3;0;Create;True;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;27;-386.2975,1223.9;Float;False;3;0;FLOAT;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;35;173.2686,791.7183;Float;True;Property;_Normal_Global;Normal_Global;9;0;Create;True;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;26;-191.2974,1223.9;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;39;-134.4218,51.32345;Float;False;Constant;_Color1;Color 1;13;0;Create;True;0,0,0,0;0,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;34;347.6829,584.5804;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;14;18.0021,-278.4009;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0.0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;369.4001,-13.80001;Float;False;True;0;Float;ASEMaterialInspector;0;0;Standard;AVP/Ground;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;3;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;False;False;False;False;False;False;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;0;32;2;4;True;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;5;38;0
WireConnection;15;5;38;0
WireConnection;16;5;38;0
WireConnection;19;0;5;0
WireConnection;19;1;15;0
WireConnection;19;2;13;1
WireConnection;36;0;37;0
WireConnection;36;1;10;0
WireConnection;12;0;1;0
WireConnection;12;1;36;0
WireConnection;12;2;13;1
WireConnection;20;0;19;0
WireConnection;20;1;16;0
WireConnection;20;2;13;2
WireConnection;27;0;1;4
WireConnection;27;1;10;4
WireConnection;27;2;13;1
WireConnection;26;0;27;0
WireConnection;26;1;11;4
WireConnection;26;2;13;2
WireConnection;34;0;20;0
WireConnection;34;1;35;0
WireConnection;14;0;12;0
WireConnection;14;1;11;0
WireConnection;14;2;13;2
WireConnection;0;0;14;0
WireConnection;0;1;34;0
WireConnection;0;3;39;0
WireConnection;0;4;26;0
ASEEND*/
//CHKSM=989BA9DBE7D1A6DC25A368917AA01F8D6A296EDD