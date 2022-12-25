import MetalKit

class GameObject : Transform {
    
    public var components: [Component]! = []
    
    init(components: [Component]){
        self.components = components
    }
    
    public func addComponent(component: Component){
        components.append(component)
    }
    
    public func update(deltaTime: Float){
        for component in components {
            if let updatableComponent = component as? UpdatableComponent {
                updatableComponent.update(deltaTime: deltaTime)
            }
        }
        
        // for child in children {
        //     children.update(deltaTime: deltaTime)
        // }
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        for component in components {
            if let renderableComponent = component as? RenderableComponent {
                renderableComponent.render(renderCommandEncoder: renderCommandEncoder)
            }
        }
    }
}
