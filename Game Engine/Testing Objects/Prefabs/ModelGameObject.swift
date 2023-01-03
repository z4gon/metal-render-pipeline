import MetalKit

class ModelGameObject : GameObject {
    
    init(
        modelMeshReference: ModelMeshReference,
        textureReference: TextureReference
    ) {
        super.init()
        
        let material = TextureSampleMaterial(textureReference)
        
        self.addComponent(MeshRenderer(meshReference: modelMeshReference, material: material))
        self.addComponent(RotateYComponent())
    }
}
