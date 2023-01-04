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
    }
    
    override func render() {
        
        updateSceneConstants()
        
        // set the view matrix and projection matrix
        Graphics.renderCommandEncoder.setVertexBytes(&_sceneConstants, length: SceneConstants.stride, index: 2)
        
        // set light data
        if let lightsBuffer = LightManager.lightsBuffer {
            var lightsCount = LightManager.lightsCount
            Graphics.renderCommandEncoder.setFragmentBuffer(lightsBuffer, offset: 0, index: 0)
            Graphics.renderCommandEncoder.setFragmentBytes(&lightsCount, length: Int32.stride, index: 1)
        }
        
        super.render()
    }
}
