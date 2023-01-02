import MetalKit

class CubeAndQuadScene : Scene {
    
    override func buildScene() {
        
        // base quad
        let quadGameObject = QuadGameObject()
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
        let cameraGameObject = GameObject()
        cameraGameObject.position = float3(0, 0, 3)
        cameraGameObject.addComponent(DebugCameraComponent())
        
        addChild(cameraGameObject)
    }
}
