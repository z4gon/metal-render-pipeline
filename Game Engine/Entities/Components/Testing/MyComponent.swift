import MetalKit

class MyComponent : Component, Updatable {
    
    var time: Float = 0
    
    func doUpdate(deltaTime: Float) {
        time += deltaTime
        let deltaPosition = cos(time)
        
        gameObject.position = float3(deltaPosition, gameObject.position.y, gameObject.position.z)
    }
}
