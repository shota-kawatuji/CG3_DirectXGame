// ジオメトリシェーダからピクセルシェーダへの出力
struct GSOutput
{
	float4 pos : SV_POSITION; // システム用頂点座標
	float3 normal : NORMAL; // 法線ベクトル
	float2 uv : TEXCOOD; // uv値
};

[maxvertexcount(3)]
void main(
	triangle float4 input[3] : SV_POSITION, 
	inout TriangleStream< GSOutput > output
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.pos = input[i];
		output.Append(element);
	}
}