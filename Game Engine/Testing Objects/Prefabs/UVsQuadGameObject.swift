import MetalKit

class UVsQuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        let mesh = MeshCache.get(.Quad)
        let material = UVsMaterial()
        
        self.addComponent(MeshRenderer(mesh: mesh, material: material))
        self.addComponent(RotateYComponent())
    }
}
