// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../../Structs.metal"
using namespace metal;

fragment half4 vertex_color_fragment_shader(
    const FragmentData IN [[ stage_in ]]
){
    float4 color = IN.color;
    return half4(color.r, color.g, color.b, color.a);
}
