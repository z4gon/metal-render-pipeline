// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../Structs.metal"
using namespace metal;

fragment half4 texture_sample_fragment_shader(
    const FragmentData IN [[ stage_in ]]
){
    return half4(IN.uv.x, IN.uv.y, 0, 1);
}