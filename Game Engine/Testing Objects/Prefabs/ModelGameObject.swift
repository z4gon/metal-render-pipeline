import MetalKit

class ModelGameObject : GameObject {
    
    init(
        modelMeshReference: ModelMeshReference,
        textureReference: TextureReference
    ) {
        super.init()
        
        let material = LitTextureSampleMaterial(textureReference)
        
        self.addComponent(MeshRenderer(meshReference: modelMeshReference, material: material))
        self.addComponent(RotateYComponent())
    }
}
