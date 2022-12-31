import MetalKit

class GameObject : Transform {
    private var _components: [Component]! = []
    
    public func addComponent(_ component: Component){
        _components.append(component)
        component.setGameObject(self)
        
        // set the camera as the main camera
        if let camera  = component as? Camera {
            CameraManager.mainCamera = camera
        }
    }
}

extension GameObject : EarlyUpdatable {
    public func doEarlyUpdate(deltaTime: Float){
        for component in _components {
            if let updatableComponent = component as? EarlyUpdatable {
                updatableComponent.doEarlyUpdate(deltaTime: deltaTime)
            }
        }
    }
}

extension GameObject : Updatable {
    public func doUpdate(deltaTime: Float){
        for component in _components {
            if let updatableComponent = component as? Updatable {
                updatableComponent.doUpdate(deltaTime: deltaTime)
            }
        }
    }
}

extension GameObject : LateUpdatable {
    public func doLateUpdate(deltaTime: Float){
        for component in _components {
            if let updatableComponent = component as? LateUpdatable {
                updatableComponent.doLateUpdate(deltaTime: deltaTime)
            }
        }
    }
}

extension GameObject : Renderable {
    public func doRender(renderCommandEncoder: MTLRenderCommandEncoder){
        for component in _components {
            if let renderableComponent = component as? Renderable {
                renderableComponent.doRender(renderCommandEncoder: renderCommandEncoder)
            }
        }
    }
}
