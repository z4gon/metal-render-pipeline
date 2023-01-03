import MetalKit

class MeshRenderer : Component, Renderable, LateUpdatable {
    
    private var _modelConstants: ModelConstants! = ModelConstants()
    
    private var _meshReference: MeshReference!
    private var _material: Material!
    
    init(meshReference: MeshReference, material: Material) {
        _meshReference = meshReference
        _material = material
    }
    
    func updateModelConstants() {
        _modelConstants.modelMatrix = gameObject.modelMatrix
    }
    
    func doLateUpdate(){
        updateModelConstants()
    }
    
    func doRender() {
        
        Graphics.renderCommandEncoder.setRenderPipelineState(RenderPipelineStateCache.get(_material))
        
        // Vertex Shader data
        Graphics.renderCommandEncoder.setVertexBytes(&_modelConstants, length: ModelConstants.stride, index: 1) // model matrix
        
        _material.setGpuValues()
        
        Graphics.renderCommandEncoder.setDepthStencilState(DepthStencilStateCache.get(.Less))
        
        let mesh = MeshCache.get(_meshReference)
        
        if let builtInMesh = mesh as? BuiltInMesh {
            renderBuiltInMesh(builtInMesh)
        } else if let modelMesh = mesh as? ModelMesh {
            renderModelMesh(modelMesh)
        }
    }
    
    func renderBuiltInMesh(_ mesh: BuiltInMesh) {
        Graphics.renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        
        if(mesh.indices.count > 0){
            Graphics.renderCommandEncoder.drawIndexedPrimitives(
                type: MTLPrimitiveType.triangle,
                indexCount: mesh.indices.count,
                indexType: MTLIndexType.uint32,
                indexBuffer: mesh.indexBuffer,
                indexBufferOffset: 0,
                instanceCount: 1 // for now, might change in the future
            )
        } else {
            Graphics.renderCommandEncoder.drawPrimitives(
                type: MTLPrimitiveType.triangle,
                vertexStart: 0,
                vertexCount: mesh.vertices.count
            )
        }
    }
    
    func renderModelMesh(_ mesh: ModelMesh) {
        
        if(mesh.mtkMesh! != nil) { return }
        
        for vertexBuffer in mesh.mtkMesh!.vertexBuffers {
            Graphics.renderCommandEncoder.setVertexBuffer(vertexBuffer.buffer, offset: vertexBuffer.offset, index: 0)
            
            for submesh in mesh.mtkMesh!.submeshes {
                Graphics.renderCommandEncoder.drawIndexedPrimitives(
                    type: submesh.primitiveType,
                    indexCount: submesh.indexCount,
                    indexType: submesh.indexType,
                    indexBuffer: submesh.indexBuffer.buffer,
                    indexBufferOffset: submesh.indexBuffer.offset,
                    instanceCount: 1 // for now, might change in the future
                )
            }
        }
    }
}
