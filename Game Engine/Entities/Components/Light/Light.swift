import MetalKit

enum LightType {
    case Point
    case Directional
}

class Light : Component {
    
    public var type: LightType = LightType.Point
    
    public var intensity: Float = 1
    public var ambient: Float = 0.3
    public var color: float4 = Colors.White
    
    public var data: LightData! {
        return LightData(
            position: gameObject.position,
            color: color,
            intensity: intensity,
            ambient: ambient
        )
    }
}
