// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
using namespace metal;

struct VertexData {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
    float2 uv [[ attribute(2) ]];
};

struct FragmentData {
    // use position attribute to prevent interpolation of the value
    float4 position [[ position ]];
    float4 color;
    float2 uv;
};

struct ModelConstants {
    float4x4 modelMatrix;
};

struct SceneConstants {
    float4x4 viewMatrix;
    float4x4 projectionMatrix;
};
