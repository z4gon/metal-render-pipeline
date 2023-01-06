import MetalKit

class Scene : Transform {
    
    private var _sceneConstants: SceneConstants! = SceneConstants()
    
    override init(){
        super.init()
        buildScene()
    }
    
    func buildScene() { }
    
    func updateSceneConstants() {
        _sceneConstants.viewMatrix = CameraManager.mainCamera.viewMatrix
        _sceneConstants.projectionMatrix = CameraManager.mainCamera.projectionMatrix
        _sceneConstants.time = Time.time
        _sceneConstants.cameraPosition = CameraManager.mainCamera.gameObject.position
    }
    
    override func render() {
        
        updateSceneConstants()
        
        // set the view matrix and projection matrix
        Graphics.renderCommandEncoder.setVertexBytes(&_sceneConstants, length: SceneConstants.stride, index: 2)
        
        // set light data
        if LightManager.lightsCount > 0 {
            var lightsCount = LightManager.lightsCount
            Graphics.renderCommandEncoder.setVertexBuffer(LightManager.lightsBuffer, offset: 0, index: 3)
            Graphics.renderCommandEncoder.setVertexBytes(&lightsCount, length: Int32.stride, index: 4)
        }
        
        super.render()
    }
}
