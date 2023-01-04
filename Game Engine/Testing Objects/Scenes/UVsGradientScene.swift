import MetalKit

class UVsGradientScene : Scene {
    
    override func buildScene() {
        
        // base quad
        let quadGameObject = UVsGradientQuadGameObject()
        addChild(quadGameObject)
        
        // camera
        addChild(DebugCameraGameObject())
    }
}
