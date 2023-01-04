import MetalKit

class LightManager {
    public static var lightsBuffer: MTLBuffer! {
        if(_lightsBuffer == nil) {
            
            for light in _lights {
                let lightData = LightData(
                    position: light.gameObject.position,
                    intensity: light.intensity,
                    color: light.color
                )
                _lightDatas.append(lightData)
            }
            
            _lightsBuffer = Engine.device.makeBuffer(bytes: _lightDatas, length: LightData.stride * _lightDatas.count , options: [])
        }
        
        return _lightsBuffer
    }
    
    private static var _lightDatas: [LightData]! = []
    private static var _lights: [Light]! = []
    private static var _lightsBuffer: MTLBuffer!
    
    static func addLight(_ light: Light) {
        _lights.append(light)
    }
}
