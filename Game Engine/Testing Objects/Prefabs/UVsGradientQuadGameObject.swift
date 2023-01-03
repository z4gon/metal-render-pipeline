import MetalKit

class UVsGradientQuadGameObject : GameObject {
    
    override init() {
        super.init()
        
        let material = UVsMaterial()
        
        self.addComponent(MeshRenderer(meshReference: BuiltInMeshReference(.Quad), material: material))
        self.addComponent(RotateYComponent())
    }
}
