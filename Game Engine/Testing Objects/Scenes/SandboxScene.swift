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
        addChild(LightGameObject(position: float3(0.5, 0.5, 0), color: Colors.White))
//        addChild(LightGameObject(position: float3(-0.5, 0.5, 0), color: Colors.Blue))
//        addChild(LightGameObject(position: float3(-0.5, -0.5, 0), color: Colors.Red))
    }
}
