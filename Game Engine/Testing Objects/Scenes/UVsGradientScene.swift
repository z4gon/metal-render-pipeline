import MetalKit

class UVsGradientScene : Scene {
    
    override func buildScene() {
        
        // base quad
        let quadGameObject = UVsGradientQuadGameObject()
        addChild(quadGameObject)
        
        // camera
        let cameraGameObject = GameObject()
        cameraGameObject.position = float3(0, 0, 2)
        cameraGameObject.addComponent(DebugCameraComponent())
        
        addChild(cameraGameObject)
    }
}
