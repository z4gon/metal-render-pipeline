import MetalKit

class SandboxScene : Scene {
    
    override func buildScene() {
        
        addChild(CubeGameObject())
        
        // camera
        let cameraGameObject = GameObject()
        cameraGameObject.position = float3(0, 0, 3)
        cameraGameObject.addComponent(DebugCameraComponent())
        
        addChild(cameraGameObject)
    }
}
