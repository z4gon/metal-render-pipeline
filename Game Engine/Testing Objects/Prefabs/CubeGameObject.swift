import MetalKit

class CubeGameObject : GameObject {
    
    override init() {
        super.init()
        
        let meshRenderer = MeshRenderer(mesh: MeshCache.getMesh(.Cube))
        self.addComponent(component: meshRenderer)
        
        let component = RotateComponent()
        self.addComponent(component: component)
    }
}
