import MetalKit

enum SceneType {
    case Sandbox
}

class SceneManager {
    
    private static var _currentScene: Scene!
    
    public static func initialize(_ sceneType: SceneType){
        setScene(sceneType)
    }
    
    public static func setScene(_ sceneType: SceneType){
        switch sceneType {
            case .Sandbox:
                _currentScene = SandboxScene()
        }
    }
    
    public static func tickScene(deltaTime: Float, renderCommandEncoder: MTLRenderCommandEncoder) {
        
        _currentScene.earlyUpdate(deltaTime: deltaTime)
        _currentScene.update(deltaTime: deltaTime)
        _currentScene.lateUpdate(deltaTime: deltaTime)
        
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
