import MetalKit

class GameViewRenderer: NSObject {
    
    private var _rootGameObject: Transform;
    
    override init() {
        _rootGameObject = GameObject()
        let gameObject = (_rootGameObject as? GameObject)!
        
        let meshRenderer = MeshRenderer(mesh: MeshCache.getMesh(.Quad))
        gameObject.addComponent(component: meshRenderer)
        
        let myComponent = MyComponent()
        gameObject.addComponent(component: myComponent)
        
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
        
        _rootGameObject.update(deltaTime: 1.0 / Float(view.preferredFramesPerSecond))
        _rootGameObject.render(renderCommandEncoder: renderCommandEncoder!)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
