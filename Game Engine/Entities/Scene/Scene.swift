import MetalKit

class Scene : Transform {
    
    private var _sceneConstants: SceneConstants! = SceneConstants()
    
    override init(){
        super.init()
        buildScene()
    }
    
    func buildScene() {}
    
    func updateSceneConstants() {
        _sceneConstants.viewMatrix = CameraManager.mainCamera.viewMatrix
    }
    
    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        updateSceneConstants()
        
        // set the view matrix
        renderCommandEncoder.setVertexBytes(&_sceneConstants, length: SceneConstants.stride, index: 2)
        
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
}
