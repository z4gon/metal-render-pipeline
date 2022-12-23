import MetalKit

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
        
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateCache.PipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: self.vertices.count)
    }
}
