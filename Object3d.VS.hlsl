#include"Object3d.hlsli"



struct TransformationMatrix
{
    float32_t4x4 WVP;
};
ConstantBuffer<TransformationMatrix> gTransformationMatrix : register(b0);

struct VertexShaderOutput
{
    float32_t4 position : SV_POSITION;
    float32_t4 texcoord : TEXCOORD0;
};

struct VertexShaderInput
{
    float32_t4 position : POSITION;
};

VertexShaderOutput main(VertexShaderInput input)
{
    VertexShaderOutput output;
    output.position = mul(input.position, gTransformationMatrix.WVP); //output.position = input.position
    output.texcoord = input.texcoord;
    return output;
}