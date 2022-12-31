import MetalKit

class QuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(mesh: MeshCache.getMesh(.Quad)))
        self.addComponent(RotateComponent())
    }
}
