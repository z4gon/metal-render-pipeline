// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../../Structs.metal"
using namespace metal;

fragment half4 lit_texture_sample_fragment_shader(
    const FragmentData IN [[ stage_in ]],
                                                  
    constant MaterialData & materialData [[ buffer(0) ]],
                                                  
    constant LightData * lights [[ buffer(1) ]],
    constant int & lightsCount [[ buffer(2) ]],
                                              
    // sampler and texture2d coming in their corresponding memory blocks
    sampler sampler2d [[ sampler(0) ]],
    texture2d<float> texture [[ texture(0) ]]
){
    // sample texture
    float4 color = texture.sample(sampler2d, IN.uv);
    
    float4 totalAmbient = float4(0,0,0,1);
    float4 totalDiffuse = float4(0,0,0,1);
    float4 totalSpecular = float4(0,0,0,1);
    for(int i = 0; i < lightsCount; i++){
        LightData light = lights[i];
        
        // light direction
        float4 lightDir = float4(light.position.xyz, 1) - IN.worldPosition;
        
        // attenuation
        float distanceToLight = length(lightDir);
        float attenuation = 1 - clamp(distanceToLight/light.range, 0.0, 1.0);
        
        // ambient
        float4 ambient = light.color * light.ambient * attenuation;
        
        totalAmbient += ambient;
        
        // diffuse
        float nDotL = max(dot(normalize(IN.worldNormal), normalize(lightDir)), 0.0);
        float4 diffuse =  light.color * nDotL * light.intensity * attenuation;
        
        totalDiffuse += diffuse;
        
        // specular
        float3 viewDir = IN.cameraPosition - IN.worldPosition.xyz;
        float3 reflectedLightDir = reflect(-normalize(lightDir.xyz), normalize(IN.worldNormal.xyz));
        float vDotL = max(0.0, dot(reflectedLightDir, normalize(viewDir))); // avoid negative values
        vDotL = pow(vDotL, materialData.glossiness);
        float4 specular =  light.color * vDotL * light.intensity * attenuation;
        
        totalSpecular += specular;
    }

    float4 phong = totalAmbient + totalDiffuse + totalSpecular;
    color = color * phong;
    
    return half4(color.r, color.g, color.b, color.a);
}
