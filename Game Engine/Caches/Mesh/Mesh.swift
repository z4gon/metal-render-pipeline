enum MeshType{
    case Triangle
    case Quad
}

class Mesh {
    public var vertices: [Vertex]!
    
    init(){
        createVertices()
    }
    
    func createVertices() {}
}
