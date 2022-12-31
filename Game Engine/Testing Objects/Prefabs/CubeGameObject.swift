import MetalKit

class CubeGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(mesh: MeshCache.get(.Cube)))
        self.addComponent(RotateComponent())
    }
}
