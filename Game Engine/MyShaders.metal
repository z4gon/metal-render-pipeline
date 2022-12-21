//
//  MyShaders.metal
//  Game Engine
//
//  Created by z4gon on 11/28/22.
//

// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
// https://stackoverflow.com/questions/57692571/metal-vertex-shader-warning-in-swift-5

#include <metal_stdlib>
using namespace metal;

struct VertexData {
    float3 position;
    float4 color;
};

struct FragmentData {
    float4 position [[ position ]]; // use position attribute to prevent interpolation of the value
    float4 color;
};

vertex FragmentData basic_vertex_shader(
  const device VertexData *vertices [[ buffer(0) ]], // access the vertices buffer at buffer with index 0
  const uint vertexID [[ vertex_id ]] // get the vertex id, which corresponds to the index of the vertex in the buffer
){
    VertexData IN = vertices[vertexID];
    
    FragmentData OUT;
    
    OUT.position = float4(IN.position, 1); // return the vertex position in homogeneous screen space
    OUT.color = IN.color;
    
    return OUT; // return the vertex position in homogeneous screen space
}

fragment half4 basic_fragment_shader(
    const FragmentData IN [[ stage_in ]]
){
    float4 color = IN.color;
    return half4(color.r, color.g, color.b, color.a);
}
