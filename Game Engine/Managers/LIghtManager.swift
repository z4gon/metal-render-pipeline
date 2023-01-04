import MetalKit

class LightManager {
    public static var lightsBuffer: MTLBuffer? {
        if(_lights.count == 0) { return nil }
        
        if(_lightsBuffer == nil) {
            
            for light in _lights {
                _lightDatas.append(light.data)
            }
            
            _lightsBuffer = Engine.device.makeBuffer(bytes: _lightDatas, length: LightData.stride * _lightDatas.count , options: [])
        }
        
        return _lightsBuffer
    }
    
    public static var lightsCount: Int! {
        return _lights.count
    }
    
    private static var _lightDatas: [LightData]! = []
    private static var _lights: [Light]! = []
    private static var _lightsBuffer: MTLBuffer!
    
    static func addLight(_ light: Light) {
        _lights.append(light)
    }
}
