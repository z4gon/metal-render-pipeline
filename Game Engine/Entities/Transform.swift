import MetalKit

class Transform {
    
    public var gameObject: GameObject!
    
    private var _children: [Transform]!
    
    init(children: [Transform]){
        _children = children
    }
    
    public func update(deltaTime: Float) {
        for child in _children {
            child.gameObject.update(deltaTime: deltaTime)
        }
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        for child in _children {
            child.gameObject.render(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
