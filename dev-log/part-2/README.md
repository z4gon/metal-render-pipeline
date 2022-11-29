# Part 2: Draw a simple Triangle in the Screen

[Back to Dev Log](../README.md)

## References

- [Metal Render Pipeline tutorial series by Rick Twohy](https://www.youtube.com/playlist?list=PLEXt1-oJUa4BVgjZt9tK2MhV_DW7PVDsg)
- [Metal Shading Language Specification](https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf)

---

## Table of Content

- [Vertex Buffer](#vertex-buffer)
- [Vertex Shader](#vertex-shader)
- [Draw Primitives](#draw-primitives)
- [Result](#result)

---

## Vertex Buffer

```swift
// counter clock wise to define the face
var vertices: [float3] = [
    float3(0, 1, 0),    // top mid
    float3(-1, -1, 0),  // bot left
    float3(1, -1, 0),   // top right
]

var vertexBuffer: MTLBuffer!;
```

```swift
func createBuffers() {
    let vertexMemSize = MemoryLayout<float3>.stride

    vertexBuffer = device?.makeBuffer(bytes: vertices, length: vertexMemSize * vertices.count, options: [])
}
```

---

## Vertex Shader

```c
// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf
vertex float4 basic_vertex_shader(
  device float3 *vertices [[ buffer(0) ]], // access the vertices buffer at buffer with index 0
  uint vertexID [[ vertex_id ]] // get the vertex id, which corresponds to the index of the vertex in the buffer
){
    return float4(vertices[vertexID], 1); // return the vertex position in homogeneous screen space
}
```

---

## Draw Primitives

```swift
// send info to render command encoder
renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
// draw a triangle using the vertices in the buffer
renderCommandEncoder?.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: vertices.count)
```

---

# Result

![Picture](./1.jpg)
