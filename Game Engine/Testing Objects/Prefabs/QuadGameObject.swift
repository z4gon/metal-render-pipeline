import MetalKit

class QuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        let meshRenderer = MeshRenderer(mesh: MeshCache.getMesh(.Quad))
        self.addComponent(component: meshRenderer)
        
        let moveComponent = MoveComponent()
        self.addComponent(component: moveComponent)
    }
}
