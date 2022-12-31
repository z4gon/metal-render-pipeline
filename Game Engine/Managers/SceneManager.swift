import MetalKit

enum SceneType {
    case Sandbox
    case PointingTriangles
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
            case .PointingTriangles:
                _currentScene = PointingTrianglesScene()
        }
    }
    
    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        _currentScene.earlyUpdate()
        _currentScene.update()
        _currentScene.lateUpdate()
        
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
