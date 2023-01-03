import MetalKit

class ModelMeshLoader {
    private var _meshReference: ModelMeshReference!
    
    init(_ meshReference: ModelMeshReference) {
        _meshReference = meshReference
    }
    
    public func load()->Mesh {
        guard let url = Bundle.main.url(forResource: _meshReference.name, withExtension: _meshReference.fileExtension) else {
            fatalError("ERROR::LOADING::MODEL::__\(_meshReference.name!).\(_meshReference.fileExtension!)__::does not exist")
        }
        
        let vertexDescriptor = MTKModelIOVertexDescriptorFromMetal(VertexDescriptorCache.get(.Basic))
        
        // make each attribute mapped to each attribute type
        (vertexDescriptor.attributes[0] as! MDLVertexAttribute).name = MDLVertexAttributePosition
        (vertexDescriptor.attributes[1] as! MDLVertexAttribute).name = MDLVertexAttributeNormal
        (vertexDescriptor.attributes[2] as! MDLVertexAttribute).name = MDLVertexAttributeColor
        (vertexDescriptor.attributes[3] as! MDLVertexAttribute).name = MDLVertexAttributeTextureCoordinate
        
        let bufferAllocator = MTKMeshBufferAllocator(device: Engine.device)
        let asset: MDLAsset = MDLAsset(
            url: url,
            vertexDescriptor: vertexDescriptor,
            bufferAllocator: bufferAllocator
        )
        
        var meshes: [Any]! = []
        do {
            meshes = try MTKMesh.newMeshes(asset: asset, device: Engine.device).metalKitMeshes
        } catch {
            print("ERROR::LOADING::MODEL::__\(_meshReference.name!).\(_meshReference.fileExtension!)__::\(error)")
        }
        
        return ModelMesh(loadedMesh: meshes[_meshReference.meshIndex])
    }
}
