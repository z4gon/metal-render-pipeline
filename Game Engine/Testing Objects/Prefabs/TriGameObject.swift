import MetalKit

class TriGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(mesh: MeshCache.get(.Triangle), material: VertexColorMaterial()))
        self.addComponent(FaceMouseComponent())
    }
}
