import MetalKit

class GameViewRenderer: NSObject {
    
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
        
        SceneManager.tickScene(deltaTime: 1.0 / Float(view.preferredFramesPerSecond), renderCommandEncoder: renderCommandEncoder!)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
