# Part 3: Vertex and Fragment Shaders

[Back to Dev Log](../README.md)

## References

- [Metal Render Pipeline tutorial series by Rick Twohy](https://www.youtube.com/playlist?list=PLEXt1-oJUa4BVgjZt9tK2MhV_DW7PVDsg)
- [Using a Render Pipeline to Render Primitives](https://developer.apple.com/documentation/metal/using_a_render_pipeline_to_render_primitives)

---

## Table of Content

- [Vertex Struct in CPU](#vertex-struct)
- [Vertex Shader](#vertex-shader)
- [Fragment Shader](#fragment-shader)
- [Result](#result)

---

## Vertex Struct in CPU

We will expand the data definition for the vertices, including not only the **position** in **screen space**, but also the **color** of the vertices.

```swift
struct Vertex {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}
```

![Picture](./2.png)

[Image Source 🔗](https://developer.apple.com/documentation/metal/using_a_render_pipeline_to_render_primitives)

The vertices array now holds objects of this type, and we also need to account for this when calculating the **memory stride**.

```swift
var vertices: [Vertex]!

func createBuffers() {
    let vertexMemSize = MemoryLayout<Vertex>.stride

    vertexBuffer = device?.makeBuffer(bytes: vertices, length: vertexMemSize * vertices.count, options: [])
}
```

---

## Vertex Shader

Similarly, in the **GPU side**, we need to **model the data** with the **closest data types**.
We will read elements off of the buffer, and will represent them with these structures.

The attribute `[[ position ]]` prevents the values interpolation from happening on it. **Color** will be **interpolated** **per fragment**, depending on its position in the triangle face, respect to the defining vertices.

The interpolation happens at the **Rasterizer** stage.

![Picture](./3.png)

[Image Source 🔗](https://developer.apple.com/documentation/metal/using_a_render_pipeline_to_render_primitives)

```swift
struct VertexData {
    float3 position;
    float4 color;
};

struct FragmentData {
    float4 position [[ position ]]; // use position attribute to prevent interpolation of the value
    float4 color;
};
```

Now the **vertex funciton** takes in an array of **VertexData**.

We also need to create a new **FragmentData** structure and populate it with the corresponding values.

```swift
vertex FragmentData basic_vertex_shader(
  device VertexData *vertices [[ buffer(0) ]], // access the vertices buffer at buffer with index 0
  uint vertexID [[ vertex_id ]] // get the vertex id, which corresponds to the index of the vertex in the buffer
){
    VertexData IN = vertices[vertexID];

    FragmentData OUT;

    OUT.position = float4(IN.position, 1); // return the vertex position in homogeneous screen space
    OUT.color = IN.color;

    return OUT; // return the vertex position in homogeneous screen space
}
```

![Picture](./4.png)

[Image Source 🔗](https://developer.apple.com/documentation/metal/using_a_render_pipeline_to_render_primitives)

---

## Fragment Shader

The **fragment function** now takes in a **FragmentData** structure.

We get an **interpolated color** coming in, which we can use to paint the corresponding pixel.

```swift
fragment half4 basic_fragment_shader(FragmentData IN [[ stage_in ]]){
    float4 color = IN.color;
    return half4(color.r, color.g, color.b, color.a);
}
```

![Picture](./5.png)

[Image Source 🔗](https://developer.apple.com/documentation/metal/using_a_render_pipeline_to_render_primitives)

---

# Result

![Picture](./1.jpg)
