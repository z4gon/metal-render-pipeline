import MetalKit

class SandboxScene : Scene {
    
    override func buildScene() {
        
        // samus
        let samusGameObject = ModelGameObject(
            modelMeshReference: ModelMeshReference("samus"),
            textureReference: TextureReference("samus", fileExtension: "png", textureLoaderOrigin: MTKTextureLoader.Origin.bottomLeft)
        )
        samusGameObject.position.y = -0.4
        addChild(samusGameObject)
        
        // camera
        let cameraGameObject = GameObject()
        cameraGameObject.position = float3(0, 0, 1.3)
        cameraGameObject.addComponent(DebugCameraComponent())
        
        addChild(cameraGameObject)
        
        // light
        let lightGameObject = GameObject()
        lightGameObject.position = float3(0.5, 0.5, 0)
        
        let lightComponent = Light()
        lightComponent.intensity = 5
        lightComponent.ambient = 0.6
        lightGameObject.addComponent(lightComponent)
        
        addChild(lightGameObject)
    }
}
