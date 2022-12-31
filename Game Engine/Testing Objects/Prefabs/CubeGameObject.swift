import MetalKit

class CubeGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(mesh: MeshCache.getMesh(.Cube)))
        self.addComponent(RotateComponent())
    }
}
