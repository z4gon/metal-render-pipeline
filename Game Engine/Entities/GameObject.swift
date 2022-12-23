import MetalKit

class GameObject {
    
    public var components: [Component]!
    
    init(components: [Component]){
        self.components = components
    }
    
    public func update(deltaTime: Float){
        for component in components {
            component.update(deltaTime: deltaTime)
        }
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        for component in components {
            component.render(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
