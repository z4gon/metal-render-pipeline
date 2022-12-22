import MetalKit

// https://developer.apple.com/documentation/swift/simd3
typealias float2 = SIMD2<Float>
typealias float3 = SIMD3<Float>
typealias float4 = SIMD4<Float>

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
