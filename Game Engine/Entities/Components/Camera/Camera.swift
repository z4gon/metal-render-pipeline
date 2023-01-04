import MetalKit

enum CameraType {
    case Perspective
    case Orthogonal
}

class Camera : Component, LateUpdatable {
    
    public var viewMatrix: float4x4 = matrix_identity_float4x4
    public var projectionMatrix: float4x4 = matrix_identity_float4x4
    
    public var type: CameraType = CameraType.Perspective
    
    public var fieldOfView: Float = 60
    public var nearClippingDistance: Float = 0.1
    public var farClippingDistance: Float = 1000
    
    func updateViewMatrix() {
        var result: float4x4 = matrix_identity_float4x4
        
        // the world needs to move in the opposite direction than the camera
        result.rotateX(angle: gameObject.rotation.x)
        result.rotateY(angle: gameObject.rotation.y)
        result.rotateZ(angle: gameObject.rotation.z)
        
        result.translate(position: -gameObject.position)

        viewMatrix = result
    }
    
    func updateProjectionMatrix() {
        var result: float4x4 = matrix_identity_float4x4
        
        if(type == CameraType.Perspective) {
            result.projectPerspective(
                fieldOfViewDegrees: fieldOfView,
                aspectRatio: GameViewRenderer.aspectRatio,
                farClippingDistance: farClippingDistance,
                nearClippingDistance: nearClippingDistance
            )
        }
        
        projectionMatrix = result
    }
    
    func doLateUpdate() {
        updateViewMatrix()
        updateProjectionMatrix()
    }
}
