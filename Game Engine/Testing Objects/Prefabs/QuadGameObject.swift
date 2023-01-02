import MetalKit

class QuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        let mesh = MeshCache.get(.Quad)
        let material = FillColorMaterial(Colors.Teal)
        
        self.addComponent(MeshRenderer(mesh: mesh, material: material))
        self.addComponent(MoveComponent())
    }
}
