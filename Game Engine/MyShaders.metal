//
//  MyShaders.metal
//  Game Engine
//
//  Created by z4gon on 11/28/22.
//

#include <metal_stdlib>
using namespace metal;

struct Vertex {
    float3 position;
    float4 color;
};

struct Fragment {
    float4 position [[ position ]]; // use position attribute to prevent interpolation of the value
    float4 color;
};

// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
vertex Fragment basic_vertex_shader(
  device Vertex *vertices [[ buffer(0) ]], // access the vertices buffer at buffer with index 0
  uint vertexID [[ vertex_id ]] // get the vertex id, which corresponds to the index of the vertex in the buffer
){
    Vertex IN = vertices[vertexID];
    
    Fragment OUT;
    
    OUT.position = float4(IN.position, 1); // return the vertex position in homogeneous screen space
    OUT.color = IN.color;
    
    return OUT; // return the vertex position in homogeneous screen space
}

fragment half4 basic_fragment_shader(Fragment IN [[ stage_in ]]){
    float4 color = IN.color;
    return half4(color.r, color.g, color.b, color.a);
}
