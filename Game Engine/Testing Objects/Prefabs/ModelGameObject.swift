import MetalKit

class ModelGameObject : GameObject {
    
    init(
        modelMeshReference: ModelMeshReference,
        textureReference: TextureReference,
        glossiness: Float = 2
    ) {
        super.init()
        
        let material = LitTextureSampleMaterial(textureReference)
        material.setGlossiness(glossiness)
        
        self.addComponent(MeshRenderer(meshReference: modelMeshReference, material: material))
        self.addComponent(RotateYComponent())
    }
}
