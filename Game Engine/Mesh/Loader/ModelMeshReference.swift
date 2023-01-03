class ModelMeshReference : MeshReference {
    public var name: String!
    public var fileExtension: String! = "obj"
    public var meshIndex: Int = 0
    
    public var id: String! {
        return "\(name!).\(fileExtension!):\(meshIndex)"
    }
    
    init(
        _ name: String,
        fileExtension: String = "obj",
        meshIndex: Int = 0
    ){
        self.name = name
        self.fileExtension = fileExtension
        self.meshIndex = meshIndex
    }
    
    func load()->Mesh {
        return ModelMeshLoader(self).load()
    }
}
