# Part 5: Game Object, Libraries and Renderer

[Back to Readme](../../README.md)

## References

- [Metal Render Pipeline tutorial series by Rick Twohy](https://www.youtube.com/playlist?list=PLEXt1-oJUa4BVgjZt9tK2MhV_DW7PVDsg)

---

## Table of Content

- [Libraries](#libraries)
- [Game Object](#game-object)
- [Renderer](#renderer)
- [Game View](#game-view)

---

## Libraries

We will extract the code that initializes the **MTLLibrary**, **MTLRenderPipelineState**, **MTLRenderPipelineDescriptor** and **MTLVertexDescriptor** into separate classes.

Each of these classes will act as a cache, with a dictionary mapping enum values to objects instances.

The pseudocode structure of these library classes will be like:

```swift
enum ElementType{
    case Basic
}

class ElementsLibrary<T> {

    private static var elements: [ElementType: T] = [:]

    public static func Initialize(){
        createElements()
    }

    public static func createElements(){
        elements.updateValue(BasicElement(), forKey: .Basic)
    }

    public static func GetElement(_ elementType: ElementType)->T{
        return elements[elementType]!
    }

}
```

This will allow us to initialize the libraries in the **Engine** class:

```swift
class Engine {

    public static var Device: MTLDevice!
    public static var CommandQueue: MTLCommandQueue!

    public static func Initialize(device: MTLDevice){

        // device is an abstract representation of the GPU
        // allows to create Metal GPU objects and send them down to the GPU
        self.Device = device

        // create the command queue to handle commands for the GPU
        self.CommandQueue = device.makeCommandQueue()

        ShaderLibrary.Initialize()
        VertexDescriptorLibrary.Initialize()
        RenderPipelineDescriptorLibrary.Initialize()
        RenderPipelineStateLibrary.Initialize()
    }
}
```

---

## Game Object

The game object will be in charge of creating the **vertexBuffer** and **drawing its primitives**, for now. In the future this should be handled by the **Mesh Renderer** **component**.

The game object also has the **vertices** array for now, in the future this should be handled by a **Mesh** class.

```swift
class GameObject {

    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!

    init() {
        createVertices()
        createBuffers()
    }

    func createVertices() {
        // counter clock wise to define the face
        vertices = [
            Vertex(position: float3(0, 1, 0),   color: float4(0, 0, 1, 1)), // top mid
            Vertex(position: float3(-1, -1, 0), color: float4(0, 1, 0, 1)), // bot left
            Vertex(position: float3(1, -1, 0),  color: float4(1, 0, 0, 1)), // top right
        ]
    }

    func createBuffers() {
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices, length: Vertex.stride * vertices.count, options: [])
    }

    func render(renderCommandEncoder: MTLRenderCommandEncoder){

        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: self.vertices.count)
    }
}
```

---

## Renderer

To further simplify the **GameView** class, we will use a **MTKViewDelegate** to take on the work of actually rendering the view at 60 fps.

For now it is also in charge of initializing the game objects, but that will be handled by the **Scene** in the future.

```swift
class GameViewRenderer: NSObject {
    var gameObject: GameObject = GameObject()
}

// we will delegate the rendering to this class
extension GameViewRenderer: MTKViewDelegate {

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // when the window is resized
    }

    func draw(in view: MTKView){
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }

        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()

        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)

        self.gameObject.render(renderCommandEncoder: renderCommandEncoder!)

        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
```

---

## Game View

Now the **Game View** is just in charge of **initializing itself**, **initializing the Engine**, and **delegating the rendering** to its delegate.

In the future this view will also be in charge of **capturing mouse and keyboard inputs**.

```swift
class GameView: MTKView {

    var renderer: GameViewRenderer!

    required init(coder: NSCoder) {
        super.init(coder: coder)

        self.device = MTLCreateSystemDefaultDevice()
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.PixelFormat

        Engine.Initialize(device: self.device!)

        self.renderer = GameViewRenderer()
        self.delegate = self.renderer
    }
}
```
