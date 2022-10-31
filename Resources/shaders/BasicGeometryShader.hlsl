// �W�I���g���V�F�[�_����s�N�Z���V�F�[�_�ւ̏o��
struct GSOutput
{
	float4 svpos : SV_POSITION; // �V�X�e���p���_���W
	float3 normal : NORMAL; // �@���x�N�g��
	float2 uv : TEXCOORD; // uv�l
};

#include "BasicShaderHeader.hlsli"

//// �O�p�`�̓��͂���A�_��3�o�͂���T���v��
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

//// �O�p�`�̓��͂���A������1�o�͂���T���v��
//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//
//	// �����̎n�_
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//
//	// �����̏I�_
//	element.svpos = input[1].svpos;
//	element.normal = input[1].normal;
//	element.uv = input[1].uv;
//	output.Append(element);
//}

//// �O�p�`�̓��͂���A������3�o�͂���T���v��
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//	// �O�p�`�̒��_1�_������
//	for (uint i = 0; i < 3; i++) {
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
//
//	// �����̏I�_
//	if (i == 2) {
//		// +1����ƈ��邩��A�ŏ��ɖ߂�
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
//	// ���݂̃X�g���b�v���I�����A���̃X�g���b�v���J�n
//	output.RestartStrip();
//}

//// �O�p�`�̓��͂���A������3�o�͂���T���v��
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
//		// ���_��1�ǉ�
//		output.Append(element);
//	}
//	// �ŏ��̓_��������x�ǉ�
//	element.svpos = input[0].svpos;
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	output.Append(element);
//}

//// �O�p�`�̓��͂���A�O�p�`���o�͂��邪�A
//// �r����UV�����H���ă^�C�����O
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
//		// UV��2�{��
//		element.uv = input[i].uv * 2.0f;
//		output.Append(element);
//	}
//}

// �O�p�`�̓��͂���A�O�p�`��2�o��
[maxvertexcount(3)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	// 1�ڂ̎O�p�`
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv * 2.0f;
		output.Append(element);
	}
	// ���݂̃X�g���b�v���I��
	output.RestartStrip();
	// 2�ڂ̎O�p�`
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		// X������20���炷
		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
		element.normal = input[i].normal;
		// UV��5�{��
		element.uv = input[i].uv * 5.0f;
		output.Append(element);
	}
}