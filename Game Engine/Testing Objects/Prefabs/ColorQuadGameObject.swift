import MetalKit

class ColorQuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        let material = FillColorMaterial(Colors.Teal)
        
        self.addComponent(MeshRenderer(meshReference: BuiltInMeshReference(.Quad), material: material))
        self.addComponent(MoveComponent())
    }
}
