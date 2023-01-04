import MetalKit

class LightManager {
    private static var _lights: [Light]! = []
    public static var lights: [Light]! {
        return _lights
    }
    
    static func addLight(_ light: Light) {
        _lights.append(light)
    }
}
