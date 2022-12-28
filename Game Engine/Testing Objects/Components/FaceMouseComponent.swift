import MetalKit

class FaceMouseComponent : Component, Updatable {
    func doUpdate(deltaTime: Float) {
        
        // calculate rotation needed to face the mouse position
        let rotationZ = -atan2f(
            Mouse.getMouseViewportPosition().x - gameObject.position.x,
            Mouse.getMouseViewportPosition().y - gameObject.position.y
        )
        
        gameObject.rotation.z = rotationZ
    }
}
