import MetalKit

class GameViewRenderer: NSObject {
    
    private var _rootGameObject: Transform;
    
    override init() {
        _rootGameObject = GameObject()
        let meshRenderer = MeshRenderer(mesh: MeshCache.getMesh(.Quad))
        (_rootGameObject as? GameObject)!.addComponent(component: meshRenderer)
        
        super.init()
    }
}

// we will delegate the rendering to this class
extension GameViewRenderer: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // when the window is resized
    }
    
    func draw(in view: MTKView){
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        _rootGameObject.render(renderCommandEncoder: renderCommandEncoder!)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
