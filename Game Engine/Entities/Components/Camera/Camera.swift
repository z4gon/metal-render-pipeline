import MetalKit

enum CameraType {
    case Perspective
    case Orthogonal
}

class Camera : Component, EarlyUpdatable {
    
    public var viewMatrix: float4x4 = matrix_identity_float4x4
    public var type: CameraType = CameraType.Perspective
    
    func updateViewMatrix() {
        var result: float4x4 = matrix_identity_float4x4
        
        // the world needs to move in the opposite direction than the camera
        result.translate(position: -gameObject.position)
//        result.scale(scale: gameObject.scale)
//
//        result.rotateX(angle: gameObject.rotation.x)
//        result.rotateY(angle: gameObject.rotation.y)
//        result.rotateZ(angle: gameObject.rotation.z)
        
        viewMatrix = result
    }
    
    // to ensure all other components get the accurate camera position
    func doEarlyUpdate(deltaTime: Float) {
        updateViewMatrix()
    }
}
