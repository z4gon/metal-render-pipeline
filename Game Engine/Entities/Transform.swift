import MetalKit

class Transform {
    public var children: [Transform]! = []
    
    public func addChildren(transform: Transform){
        children.append(transform)
    }
    
    public func update(deltaTime: Float){
        for child in children {
            child.update(deltaTime: deltaTime)
        }
        
        if let updatableSelf = self as? Updatable {
            updatableSelf.doUpdate(deltaTime: deltaTime)
        }
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        
        if let renderableSelf = self as? Renderable {
            renderableSelf.doRender(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
