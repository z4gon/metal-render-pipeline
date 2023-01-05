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
        var lightGameObject = LightGameObject(
            position: float3(-0.3, 0.3, 0.3),
            color: Colors.White,
            intensity: 7,
            ambient: 0.1,
            range: 0.9
        )
        lightGameObject.addComponent(MoveComponent(inverted: false, vertical: true))
        addChild(lightGameObject)

        lightGameObject = LightGameObject(
            position: float3(0.3, -0.3, 0.3),
            color: Colors.Blue,
            intensity: 50,
            ambient: 1,
            range: 0.7
        )
        lightGameObject.addComponent(MoveComponent(inverted: true, vertical: true))
        addChild(lightGameObject)
    }
}
