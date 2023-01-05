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
    
    private var _data: LightData = LightData()
    public var data: LightData! {
        
//        print(gameObject.position)
        
        _data.position = gameObject.position
        _data.color = color
        _data.intensity = intensity
        _data.ambient = ambient
        
        return _data
    }
}
