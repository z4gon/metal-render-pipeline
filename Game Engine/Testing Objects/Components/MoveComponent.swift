import MetalKit

class MoveComponent : Component, Updatable {
    
    var time: Float = 0
    
    func doUpdate() {
        
        gameObject.position = float3(cos(Time.time), gameObject.position.y, gameObject.position.z)
//        gameObject.scale = float3(repeating: sin(time))
//        gameObject.rotation = float3(-sin(time), cos(time), sin(time))
    }
}
