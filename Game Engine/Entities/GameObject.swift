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
        
        // keep track of the lights
        if let light  = component as? Light {
            LightManager.addLight(light)
        }
    }
}

extension GameObject : EarlyUpdatable {
    public func doEarlyUpdate(){
        for component in _components {
            if let updatableComponent = component as? EarlyUpdatable {
                updatableComponent.doEarlyUpdate()
            }
        }
    }
}

extension GameObject : Updatable {
    public func doUpdate(){
        for component in _components {
            if let updatableComponent = component as? Updatable {
                updatableComponent.doUpdate()
            }
        }
    }
}

extension GameObject : LateUpdatable {
    public func doLateUpdate(){
        for component in _components {
            if let updatableComponent = component as? LateUpdatable {
                updatableComponent.doLateUpdate()
            }
        }
    }
}

extension GameObject : Renderable {
    public func doRender(){
        for component in _components {
            if let renderableComponent = component as? Renderable {
                renderableComponent.doRender()
            }
        }
    }
}
