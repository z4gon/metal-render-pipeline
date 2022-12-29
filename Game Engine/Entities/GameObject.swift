import MetalKit

class GameObject : Transform {
    public var components: [Component]! = []
    
    public func addComponent(component: Component){
        components.append(component)
        component.gameObject = self
    }
}

extension GameObject : EarlyUpdatable {
    public func doEarlyUpdate(deltaTime: Float){
        for component in components {
            if let updatableComponent = component as? EarlyUpdatable {
                updatableComponent.doEarlyUpdate(deltaTime: deltaTime)
            }
        }
    }
}

extension GameObject : Updatable {
    public func doUpdate(deltaTime: Float){
        for component in components {
            if let updatableComponent = component as? Updatable {
                updatableComponent.doUpdate(deltaTime: deltaTime)
            }
        }
    }
}

extension GameObject : LateUpdatable {
    public func doLateUpdate(deltaTime: Float){
        for component in components {
            if let updatableComponent = component as? LateUpdatable {
                updatableComponent.doLateUpdate(deltaTime: deltaTime)
            }
        }
    }
}

extension GameObject : Renderable {
    public func doRender(renderCommandEncoder: MTLRenderCommandEncoder){
        for component in components {
            if let renderableComponent = component as? Renderable {
                renderableComponent.doRender(renderCommandEncoder: renderCommandEncoder)
            }
        }
    }
}
