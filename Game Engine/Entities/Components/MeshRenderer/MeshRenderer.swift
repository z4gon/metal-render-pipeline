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
        _modelConstants.modelMatrix = gameObject.modelMatrix
    }
    
    func doLateUpdate(){
        updateModelConstants()
    }
    
    func doRender() {
        // set the transformation matrix
        Graphics.renderCommandEncoder.setVertexBytes(&_modelConstants, length: ModelConstants.stride, index: 1)
        
        Graphics.renderCommandEncoder.setRenderPipelineState(RenderPipelineStateCache.get(.Basic))
        Graphics.renderCommandEncoder.setVertexBuffer(_vertexBuffer, offset: 0, index: 0)
        
        Graphics.renderCommandEncoder.setDepthStencilState(DepthStencilStateCache.get(.Less))
        
        if(_mesh.indices.count > 0){
            Graphics.renderCommandEncoder.drawIndexedPrimitives(
                type: MTLPrimitiveType.triangle,
                indexCount: _mesh.indices.count,
                indexType: MTLIndexType.uint32,
                indexBuffer: _indexBuffer,
                indexBufferOffset: 0,
                instanceCount: 1 // for now, might change in the future
            )
        } else {
            Graphics.renderCommandEncoder.drawPrimitives(
                type: MTLPrimitiveType.triangle,
                vertexStart: 0,
                vertexCount: _mesh.vertices.count
            )
        }
    }
}
