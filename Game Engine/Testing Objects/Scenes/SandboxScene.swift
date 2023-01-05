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
        
        lightGameObject = LightGameObject(position: float3(-0.5, -0.5, 0.3), color: Colors.Blue, intensity: 10, ambient: 0.1)
        lightGameObject.addComponent(MoveComponent(inverted: true))
        addChild(lightGameObject)
        
//        addChild(LightGameObject(position: float3(-0.5, 0.5, 0.3), color: float4(0.782, 0.170, 0.850, 1.0)))
//        addChild(LightGameObject(position: float3(-0.5, -0.5, 0.3), color: float4(0.0700, 0.426, 1.00, 1), intensity: 10, ambient: 0.1))
    }
}
