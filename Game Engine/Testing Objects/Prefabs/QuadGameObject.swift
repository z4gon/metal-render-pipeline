import MetalKit

class QuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(mesh: MeshCache.get(.Quad)))
        self.addComponent(RotateComponent())
    }
}
