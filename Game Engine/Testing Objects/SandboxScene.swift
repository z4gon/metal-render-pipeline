import MetalKit

class SandboxScene : Scene {
    
    override func buildScene() {
        
        for y in -5..<5 {
            for x in -5..<5 {
                let gameObject = QuadGameObject()
                
                gameObject.position.y = Float(Float(y) + 0.5) / 5
                gameObject.position.x = Float(Float(x) + 0.5) / 5
                gameObject.scale = float3(repeating: 0.15)
                
                addChild(transform: gameObject)
            }
        }
    }
}
