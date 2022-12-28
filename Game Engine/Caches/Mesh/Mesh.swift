enum MeshType{
    case Triangle
    case Quad
}

class Mesh {
    public var vertices: [Vertex]! = []
    public var indices: [UInt32]! = []
    
    init(){
        createMesh()
    }
    
    func createMesh() {}
}
