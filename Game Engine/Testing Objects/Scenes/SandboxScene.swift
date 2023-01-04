import MetalKit

class SandboxScene : Scene {
    
    override func buildScene() {
        
        // samus
        let samusGameObject = ModelGameObject(
            modelMeshReference: ModelMeshReference("samus"),
            textureReference: TextureReference("samus", fileExtension: "png", textureLoaderOrigin: MTKTextureLoader.Origin.bottomLeft)
        )
        samusGameObject.position.y = -0.5
        addChild(samusGameObject)
        
        // camera
        let cameraGameObject = GameObject()
        cameraGameObject.position = float3(0, 0, 2)
        cameraGameObject.addComponent(DebugCameraComponent())
        
        // light
        let light = GameObject()
        light.position = float3(0.5, 0.5, 0)
        light.addComponent(Light())
        
        addChild(cameraGameObject)
    }
}
