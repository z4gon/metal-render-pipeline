import MetalKit

class RotateComponent : Component, Updatable {
    
    func doUpdate() {
        
//        gameObject.position = float3(cos(time), gameObject.position.y, gameObject.position.z)
//        gameObject.scale = float3(repeating: sin(time))
        gameObject.rotation = float3(-sin(Time.time), cos(Time.time), sin(Time.time))
    }
}

class RotateYComponent : Component, Updatable {
    
    func doUpdate() {
        gameObject.rotation = float3(gameObject.rotation.x, cos(Time.time), gameObject.rotation.z)
    }
}
