import MetalKit

class DebugCameraGameObject : GameObject {
    
    override init() {
        super.init()
        position = float3(0, 0, 1.3)
        addComponent(DebugCameraComponent())
    }
}
