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
        addChild(DebugCameraGameObject())
        
        // lights
        var lightGameObject = LightGameObject(position: float3(0.5, 0.5, 0.3), color: Colors.White)
        lightGameObject.addComponent(MoveComponent())
        addChild(lightGameObject)
        
        lightGameObject = LightGameObject(position: float3(-0.5, -0.5, 0.3), color: Colors.Blue, intensity: 15, ambient: 0.6)
        lightGameObject.addComponent(MoveComponent(inverted: true))
        addChild(lightGameObject)
    }
}
