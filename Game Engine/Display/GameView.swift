import MetalKit

class GameView: MTKView {
    
    var renderer: GameViewRenderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        device = MTLCreateSystemDefaultDevice()
        clearColor = Preferences.ClearColor
        colorPixelFormat = Preferences.PixelFormat
        depthStencilPixelFormat = Preferences.DepthStencilPixelFormat
        
        Engine.initialize(device: device!)
        
        renderer = GameViewRenderer(self)
        delegate = renderer
    }
}
