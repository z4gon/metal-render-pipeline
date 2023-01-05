import MetalKit

class MoveComponent : Component, Updatable {
    
    private var _inverted: Bool = false
    private var _vertical: Bool = false
    
    init(inverted: Bool = false, vertical: Bool = false) {
        _inverted = inverted
        _vertical = vertical
    }
    
    func doUpdate() {
        
        let c = (_inverted ? -cos(Time.time) : cos(Time.time)) * 0.5
        let x = _vertical ? gameObject.position.x : c
        let y = !_vertical ? gameObject.position.y : c
        
        gameObject.position = float3(x, y, gameObject.position.z)
//        gameObject.scale = float3(repeating: sin(time))
//        gameObject.rotation = float3(-sin(time), cos(time), sin(time))
    }
}
