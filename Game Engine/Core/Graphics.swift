import MetalKit

class Graphics {
    private static var _renderCommandEncoder: MTLRenderCommandEncoder!
    
    public static var renderCommandEncoder: MTLRenderCommandEncoder {
        return _renderCommandEncoder
    }
    
    public static func setRenderCommandEncoder(_ renderCommandEncoder: MTLRenderCommandEncoder){
        _renderCommandEncoder = renderCommandEncoder
    }
}
