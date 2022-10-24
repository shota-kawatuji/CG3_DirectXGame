// �W�I���g���V�F�[�_����s�N�Z���V�F�[�_�ւ̏o��
struct GSOutput
{
	float4 pos : SV_POSITION; // �V�X�e���p���_���W
	float3 normal : NORMAL; // �@���x�N�g��
	float2 uv : TEXCOOD; // uv�l
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