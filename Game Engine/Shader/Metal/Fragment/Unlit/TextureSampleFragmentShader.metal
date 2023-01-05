// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../../Structs.metal"
using namespace metal;

fragment half4 texture_sample_fragment_shader(
    const FragmentData IN [[ stage_in ]],
                                              
    // sampler and texture2d coming in their corresponding memory blocks
    sampler sampler2d [[ sampler(0) ]],
    texture2d<float> texture [[ texture(0) ]]
){
    float4 color = texture.sample(sampler2d, IN.uv);
    return half4(color.r, color.g, color.b, color.a);
}
