import MetalKit

class GameViewRenderer: NSObject {
    
    public static var screenSize = float2(0,0)
    public static var aspectRatio: Float {
        return screenSize.x / screenSize.y
    }
    
    init(_ mtkView: MTKView) {
        super.init()
        updateScreenSize(view: mtkView)
    }
}

// we will delegate the rendering to this class
extension GameViewRenderer: MTKViewDelegate {
    
    public func updateScreenSize(view: MTKView){
        GameViewRenderer.screenSize = float2(Float(view.bounds.width), Float(view.bounds.height))
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // when the window is resized
        updateScreenSize(view: view)
    }
    
    func draw(in view: MTKView){
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderCommandEncoder!.label = "My Render Encoder"
        
        Time.updateTime(1.0 / Float(view.preferredFramesPerSecond))
        Graphics.setRenderCommandEncoder(renderCommandEncoder!)
        
        SceneManager.tickScene()
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
