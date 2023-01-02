import MetalKit

class UVsScene : Scene {
    
    override func buildScene() {
        
        // base quad
        let quadGameObject = UVsQuadGameObject()
        addChild(quadGameObject)
        
        // camera
        let cameraGameObject = GameObject()
        cameraGameObject.position = float3(0, 0, 2)
        cameraGameObject.addComponent(DebugCameraComponent())
        
        addChild(cameraGameObject)
    }
}
