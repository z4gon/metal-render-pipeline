import MetalKit

class GameView: MTKView {
    
    var renderer: GameViewRenderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        self.clearColor = Preferences.ClearColor
        self.colorPixelFormat = Preferences.PixelFormat
        
        Engine.Initialize(device: self.device!)
        
        self.renderer = GameViewRenderer()
        self.delegate = self.renderer
    }
}
