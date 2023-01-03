import MetalKit

class TriGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(meshReference: BuiltInMeshReference(.Triangle), material: VertexColorMaterial()))
        self.addComponent(FaceMouseComponent())
    }
}
