import MetalKit

class MeshRenderer : Component, Renderable, LateUpdatable {
    
    private var _modelConstants: ModelConstants! = ModelConstants()
    
    private var _vertexBuffer: MTLBuffer!
    private var _indexBuffer: MTLBuffer!
    
    private var _mesh: Mesh!
    
    init(mesh: Mesh) {
        _mesh = mesh
        
        _vertexBuffer = Engine.device.makeBuffer(bytes: _mesh.vertices, length: Vertex.stride * _mesh.vertices.count, options: [])
        
        if(_mesh.indices.count > 0){
            _indexBuffer = Engine.device.makeBuffer(bytes: _mesh.indices, length: UInt32.stride * _mesh.indices.count, options: [])
        }
    }
    
    func updateModelConstants() {
        var modelMatrix: float4x4 = matrix_identity_float4x4
        
        modelMatrix.translate(position: gameObject.position)
        modelMatrix.scale(scale: gameObject.scale)
        
        modelMatrix.rotateX(angle: gameObject.rotation.x)
        modelMatrix.rotateY(angle: gameObject.rotation.y)
        modelMatrix.rotateZ(angle: gameObject.rotation.z)
        
        _modelConstants.modelMatrix = modelMatrix
    }
    
    func doLateUpdate(deltaTime: Float){
        updateModelConstants()
    }
    
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
        // set the transformation matrix
        renderCommandEncoder.setVertexBytes(&_modelConstants, length: ModelConstants.stride, index: 1)
        
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateCache.getPipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(_vertexBuffer, offset: 0, index: 0)
        
        renderCommandEncoder.setDepthStencilState(DepthStencilStateCache.getDepthStencilState(.Less))
        
        if(_mesh.indices.count > 0){
            renderCommandEncoder.drawIndexedPrimitives(
                type: MTLPrimitiveType.triangle,
                indexCount: _mesh.indices.count,
                indexType: MTLIndexType.uint32,
                indexBuffer: _indexBuffer,
                indexBufferOffset: 0,
                instanceCount: 1 // for now, might change in the future
            )
        } else {
            renderCommandEncoder.drawPrimitives(
                type: MTLPrimitiveType.triangle,
                vertexStart: 0,
                vertexCount: _mesh.vertices.count
            )
        }
    }
}
