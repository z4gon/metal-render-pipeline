import MetalKit

class FaceMouseComponent : Component, Updatable {
    func doUpdate(deltaTime: Float) {
        
        // calculate rotation needed to face the mouse position
        let rotationZ = -atan2f(
            Mouse.getMouseViewportPosition(CameraManager.mainCamera).x - gameObject.position.x,
            Mouse.getMouseViewportPosition(CameraManager.mainCamera).y - gameObject.position.y
        )
        
        gameObject.rotation.z = rotationZ
    }
}
