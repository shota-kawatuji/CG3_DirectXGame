// ジオメトリシェーダからピクセルシェーダへの出力
struct GSOutput
{
	float4 svpos : SV_POSITION; // システム用頂点座標
	float3 normal : NORMAL; // 法線ベクトル
	float2 uv : TEXCOORD; // uv値
};

#include "BasicShaderHeader.hlsli"

//// 三角形の入力から、点を3つ出力するサンプル
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
//}

//// 三角形の入力から、線分を1つ出力するサンプル
//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//
//	// 線分の始点
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//	// 線分の終点
//	element.svpos = input[1].svpos;
//	element.normal = input[1].normal;
//	element.uv = input[1].uv;
//	output.Append(element);
//}

//// 三角形の入力から、線分を3つ出力するサンプル
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//	// 三角形の頂点1点ずつ扱う
//	for (uint i = 0; i < 3; i++) {
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
//
//	// 線分の終点
//	if (i == 2) {
//		// +1すると溢れるから、最初に戻す
//		element.svpos = input[0].svpos;
//		element.normal = input[0].normal;
//		element.uv = input[0].uv;
//	}
//	else {
//		element.svpos = input[+1].svpos;
//		element.normal = input[+1].normal;
//		element.uv = input[+1].uv;
//	}
//	output.Append(element);
//	// 現在のストリップを終了す、次のストリップを開始
//	output.RestartStrip();
//}

//// 三角形の入力から、線分を3つ出力するサンプル
//[maxvertexcount(4)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//	for (uint i = 0; i < 3; i++) {
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		// 頂点を1つ追加
//		output.Append(element);
//	}
//	// 最初の点をもう一度追加
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//}

//// 三角形の入力から、三角形を出力するが、
//// 途中でUVを加工してタイリング
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		// UVを2倍に
//		element.uv = input[i].uv * 2.0f;
//		output.Append(element);
//	}
//}

// 三角形の入力から、三角形を2つ出力
[maxvertexcount(3)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	// 1つ目の三角形
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv * 2.0f;
		output.Append(element);
	}
	// 現在のストリップを終了
	output.RestartStrip();
	// 2つ目の三角形
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		// X方向に20ずらす
		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
		element.normal = input[i].normal;
		// UVを5倍に
		element.uv = input[i].uv * 5.0f;
		output.Append(element);
	}
}