import MetalKit

class MeshRenderer : Component, Renderable {
    
    private var _modelConstants: ModelConstants! = ModelConstants()
    private var _vertexBuffer: MTLBuffer!
    private var _mesh: Mesh!
    
    init(mesh: Mesh) {
        _mesh = mesh
        _vertexBuffer = Engine.device.makeBuffer(bytes: _mesh.vertices, length: Vertex.stride * _mesh.vertices.count, options: [])
    }
    
    func updateModelConstants() {
        var modelMatrix: float4x4 = matrix_identity_float4x4
        
        modelMatrix.translate(direction: gameObject.position)
        
        _modelConstants.modelMatrix = modelMatrix
    }
    
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        updateModelConstants()
        
        // set the transformation matrix
        renderCommandEncoder.setVertexBytes(&_modelConstants, length: ModelConstants.stride, index: 1)
        
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateCache.getPipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(_vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: _mesh.vertices.count)
    }
}
