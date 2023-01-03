import MetalKit

class TextureQuadGameObject : GameObject {
    
    init(_ textureReference: TextureReference) {
        super.init()
        
        let material = TextureSampleMaterial(textureReference)
        
        self.addComponent(MeshRenderer(meshReference: BuiltInMeshReference(.Quad), material: material))
        self.addComponent(RotateYComponent())
    }
}
