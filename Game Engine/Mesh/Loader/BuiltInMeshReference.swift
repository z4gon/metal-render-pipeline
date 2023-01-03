enum BuiltInMeshType{
    case Triangle
    case Quad
    case Cube
}

class BuiltInMeshReference : MeshReference {
    public var builtInMeshType: BuiltInMeshType! = BuiltInMeshType.Quad
    
    public var id: String! {
        return "\(builtInMeshType!)"
    }
    
    init(
        _ builtInMeshType: BuiltInMeshType
    ){
        self.builtInMeshType = builtInMeshType
    }
    
    func load()->Mesh {
        switch builtInMeshType {
        case .Triangle:
            return TriangleMesh()
        case .Quad:
            return QuadMesh()
        case .Cube:
            return CubeMesh()
        default:
            return QuadMesh()
        }
    }
}
