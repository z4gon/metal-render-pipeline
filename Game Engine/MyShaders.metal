//
//  MyShaders.metal
//  Game Engine
//
//  Created by z4gon on 11/28/22.
//

#include <metal_stdlib>
using namespace metal;

// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
vertex float4 basic_vertex_shader(
  device float3 *vertices [[ buffer(0) ]], // access the vertices buffer at buffer with index 0
  uint vertexID [[ vertex_id ]] // get the vertex id, which corresponds to the index of the vertex in the buffer
){
    return float4(vertices[vertexID], 1); // return the vertex position in homogeneous screen space
}

fragment half4 basic_fragment_shader(){
    return half4(1); // return white for pixels inside the face
}
