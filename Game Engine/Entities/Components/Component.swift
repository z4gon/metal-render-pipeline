import MetalKit

class Component {
    private var _gameObject: GameObject!
    public var gameObject: GameObject {
        return _gameObject
    }
    
    public func setGameObject(_ gameObject: GameObject) {
        _gameObject = gameObject
    }
}
