import MetalKit

class Mesh {}

class BuiltInMesh : Mesh {
    public var vertices: [Vertex]! = []
    public var indices: [UInt32]! = []
    
    public var vertexBuffer: MTLBuffer!
    public var indexBuffer: MTLBuffer!
    
    override init() {
        super.init()
        createMesh()
        
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride * vertices.count, options: [])
        
        if(indices.count > 0){
            indexBuffer = Engine.device.makeBuffer(bytes: indices, length: UInt32.stride * indices.count, options: [])
        }
    }
    
    func createMesh() {}
}

class ModelMesh : Mesh {
    public var mtkMesh: MTKMesh? = nil
    
    init(loadedMesh: Any) {
        super.init()
        
        if let metalKitMesh = loadedMesh as? MTKMesh {
            self.mtkMesh = metalKitMesh
        }
    }
}
