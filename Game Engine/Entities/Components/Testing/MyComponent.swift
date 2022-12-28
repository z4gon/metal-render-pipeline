import MetalKit

class MyComponent : Component, Updatable {
    
    var time: Float = 0
    
    func doUpdate(deltaTime: Float) {
        time += deltaTime
        
        gameObject.position = float3(cos(time), gameObject.position.y, gameObject.position.z)
        gameObject.scale = float3(repeating: sin(time))
        gameObject.rotation = float3(gameObject.rotation.x, gameObject.rotation.y, sin(time))
    }
}
