import MetalKit

enum LightType {
    case Point
    case Directional
}

class Light : Component {
    
    public var type: LightType = LightType.Point
    
    public var intensity: Float = 1
    public var color: float4 = Colors.White
    
    init(color: float4 = Colors.White, intensity: Float = 1) {
        self.color = color
        self.intensity = intensity
    }
}
