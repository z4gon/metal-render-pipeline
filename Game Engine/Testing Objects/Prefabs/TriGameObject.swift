import MetalKit

class TriGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(mesh: MeshCache.getMesh(.Triangle)))
        self.addComponent(FaceMouseComponent())
    }
}
