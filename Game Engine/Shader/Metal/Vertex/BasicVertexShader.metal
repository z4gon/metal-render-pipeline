// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../Structs.metal"
using namespace metal;

vertex FragmentData basic_vertex_shader(
    // metal can infer the data because we are describing it using the vertex descriptor
    const VertexData IN [[ stage_in ]],
    constant ModelConstants & modelConstants [[ buffer(1) ]],
    constant SceneConstants & sceneConstants [[ buffer(2) ]],
    constant LightData * lights [[ buffer(3) ]],
    constant int & lightsCount [[ buffer(4) ]],
    constant MaterialData & materialData [[ buffer(5) ]]
){
    FragmentData OUT;
    
    OUT.worldPosition = modelConstants.modelMatrix * float4(IN.position, 1);
    
    // return the vertex position in homogeneous screen space
    // ProjectionMatrix * ViewMatrix * ModelMatrix * ObjectPosition = HSCPosition
    OUT.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * OUT.worldPosition;
    
    OUT.normal = IN.normal;
    OUT.color = IN.color;
    OUT.uv = IN.textureCoordinate;
    OUT.time = sceneConstants.time;
    
    // lighting
    float4 worldNormal = modelConstants.modelMatrix * OUT.normal;
    float3 cameraPosition = sceneConstants.cameraPosition;
    
    float4 totalAmbient = float4(0,0,0,1);
    float4 totalDiffuse = float4(0,0,0,1);
    float4 totalSpecular = float4(0,0,0,1);
    for(int i = 0; i < lightsCount; i++){
        LightData light = lights[i];
        
        // light direction
        float4 lightDir = float4(light.position.xyz, 1) - OUT.worldPosition;
        
        // attenuation
        float distanceToLight = length(lightDir);
        float attenuation = 1 - clamp(distanceToLight/light.range, 0.0, 1.0);
        
        // ambient
        float4 ambient = light.color * light.ambient * attenuation;
        
        totalAmbient += ambient;
        
        // diffuse
        float nDotL = max(dot(normalize(worldNormal), normalize(lightDir)), 0.0);
        float4 diffuse =  light.color * nDotL * light.intensity * attenuation;
        
        totalDiffuse += diffuse;
        
        // specular
        float3 viewDir = cameraPosition - OUT.worldPosition.xyz;
        float3 reflectedLightDir = reflect(-normalize(lightDir.xyz), normalize(worldNormal.xyz));
        float vDotL = max(0.0, dot(reflectedLightDir, normalize(viewDir))); // avoid negative values
        vDotL = pow(vDotL, materialData.glossiness);
        float4 specular =  light.color * vDotL * light.intensity * attenuation;
        
        totalSpecular += specular;
    }

    OUT.phong = totalAmbient + totalDiffuse + totalSpecular;
    
    return OUT;
}
