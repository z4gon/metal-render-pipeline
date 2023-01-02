import MetalKit

class TextureQuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        let mesh = MeshCache.get(.Quad)
        let material = TextureSampleMaterial("")
        
        self.addComponent(MeshRenderer(mesh: mesh, material: material))
        self.addComponent(RotateYComponent())
    }
}
