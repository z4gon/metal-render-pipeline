import MetalKit

class CubeAndQuadScene : Scene {
    
    override func buildScene() {
        
        // base quad
        let quadGameObject = ColorQuadGameObject()
//        quadGameObject.scale = float3(repeating: 1.5)
        quadGameObject.position.y = -0.5
        quadGameObject.rotation.x = 90
        addChild(quadGameObject)
        
        // cube
        let cubeGameObject = CubeGameObject()
        cubeGameObject.scale = float3(repeating: 0.4)
//        addChild(cubeGameObject)
        cubeGameObject.position.z = -0.5
        quadGameObject.addChild(cubeGameObject)
        
        // camera
        addChild(DebugCameraGameObject())
    }
}
