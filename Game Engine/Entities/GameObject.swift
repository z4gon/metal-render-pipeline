import MetalKit

class GameObject {
    
    public var components: [Component]!
    
    init(components: [Component]){
        self.components = components
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        for component in components {
            component.render(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
