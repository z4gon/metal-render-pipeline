// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
#include "../Structs.metal"
using namespace metal;

vertex FragmentData basic_vertex_shader(
  // metal can infer the data because we are describing it using the vertex descriptor
  const VertexData IN [[ stage_in ]],
  constant ModelConstants &modelConstants [[ buffer(1) ]],
  constant SceneConstants &sceneConstants [[ buffer(2) ]]
){
    FragmentData OUT;
    
    // return the vertex position in homogeneous screen space
    // ProjectionMatrix * ViewMatrix * ModelMatrix * ObjectPosition = HSCPosition
    OUT.position = sceneConstants.projectionMatrix
                    * sceneConstants.viewMatrix
                    * modelConstants.modelMatrix
                    * float4(IN.position, 1);
    
    OUT.color = IN.color;
    OUT.uv = IN.uv;
    
    return OUT;
}
