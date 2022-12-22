import MetalKit

// https://developer.apple.com/documentation/swift/simd3
typealias float2 = SIMD2<Float>
typealias float3 = SIMD3<Float>
typealias float4 = SIMD4<Float>

class GameView: MTKView {
    
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!;
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        Engine.Initialize(device: MTLCreateSystemDefaultDevice()!)
        
        self.device = Engine.Device
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.PixelFormat
        
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
    
    override func draw(_ dirtyRect: NSRect) {
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        renderCommandEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
