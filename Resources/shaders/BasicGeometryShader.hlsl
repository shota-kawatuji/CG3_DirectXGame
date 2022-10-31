// �W�I���g���V�F�[�_����s�N�Z���V�F�[�_�ւ̏o��
struct GSOutput
{
	float4 svpos : SV_POSITION; // �V�X�e���p���_���W
	float3 normal : NORMAL; // �@���x�N�g��
	float2 uv : TEXCOORD; // uv�l
};

#include "BasicShaderHeader.hlsli"

[maxvertexcount(3)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv;
		output.Append(element);
	}
}