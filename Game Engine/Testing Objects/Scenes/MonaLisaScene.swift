import MetalKit

class MonaLisaScene : Scene {
    
    override func buildScene() {
        
        // base quad
        let quadGameObject = TextureQuadGameObject(TextureReference("mona-lisa"))
        addChild(quadGameObject)
        
        // camera
        addChild(DebugCameraGameObject())
    }
}
