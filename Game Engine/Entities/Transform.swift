import MetalKit

class Transform {
    public var children: [Transform]! = []
    
    public func addChildren(transform: Transform){
        children.append(transform)
    }
    
    public func update(deltaTime: Float){
        if let updatableSelf = self as? Updatable {
            
            for child in children {
                if let updatableChild = child as? Updatable {
                    updatableChild.doUpdate(deltaTime: deltaTime)
                }
            }
            
            updatableSelf.doUpdate(deltaTime: deltaTime)
        }
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        if let renderableSelf = self as? Renderable {
            
            for child in children {
                if let renderableChild = child as? Renderable {
                    renderableChild.doRender(renderCommandEncoder: renderCommandEncoder)
                }
            }
            
            renderableSelf.doRender(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
