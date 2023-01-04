// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../../Structs.metal"
using namespace metal;

fragment half4 lit_texture_sample_fragment_shader(
    const FragmentData IN [[ stage_in ]],
                                                  
    constant LightData * lights [[ buffer(0) ]],
    constant int & lightsCount [[ buffer(1) ]],
                                              
    // sampler and texture2d coming in their corresponding memory blocks
    sampler sampler2d [[ sampler(0) ]],
    texture2d<float> texture [[ texture(0) ]]
){
    // sample texture
    float4 color = texture.sample(sampler2d, IN.uv);
    
    // light direction
//    float4 lightDir = IN.position - float4(light.position.xyz, 1);
    
    float4 totalAmbient = float4(0,0,0,1);
    for(int i = 0; i < lightsCount; i++){
        LightData light = lights[i];
        
        // ambient
        totalAmbient += light.ambient * light.color;
    }

    // diffuse
//    float lightInfluence = clamp(dot(IN.normal, lightDir), 0.0, 1.0);
//    float4 diffuse = light.color * lightInfluence * light.intensity;

    color = color * totalAmbient;
    
    return half4(color.r, color.g, color.b, color.a);
}
