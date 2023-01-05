// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../Structs.metal"
using namespace metal;

vertex FragmentData basic_vertex_shader(
  // metal can infer the data because we are describing it using the vertex descriptor
  const VertexData IN [[ stage_in ]],
  constant ModelConstants & modelConstants [[ buffer(1) ]],
  constant SceneConstants & sceneConstants [[ buffer(2) ]]
){
    FragmentData OUT;
    
    OUT.worldPosition = modelConstants.modelMatrix * float4(IN.position, 1);
    
    // return the vertex position in homogeneous screen space
    // ProjectionMatrix * ViewMatrix * ModelMatrix * ObjectPosition = HSCPosition
    OUT.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * OUT.worldPosition;
    
    OUT.normal = IN.normal;
    
    OUT.worldNormal = modelConstants.modelMatrix * OUT.normal;
    
    OUT.color = IN.color;
    OUT.uv = IN.textureCoordinate;
    OUT.time = sceneConstants.time;
    OUT.cameraPosition = sceneConstants.cameraPosition;
    
    return OUT;
}
