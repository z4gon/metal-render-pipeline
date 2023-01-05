import MetalKit

class MoveComponent : Component, Updatable {
    
    private var _inverted: Bool = false
    
    init(inverted: Bool = false) {
        _inverted = inverted
    }
    
    func doUpdate() {
        
        gameObject.position = float3(_inverted ? -cos(Time.time) : cos(Time.time), gameObject.position.y, gameObject.position.z)
//        gameObject.scale = float3(repeating: sin(time))
//        gameObject.rotation = float3(-sin(time), cos(time), sin(time))
    }
}
