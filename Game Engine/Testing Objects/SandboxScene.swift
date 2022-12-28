import MetalKit

class SandboxScene : Scene {
    
    override func buildScene() {
        
        let count: Int = 5
        
        for y in -count..<count {
            for x in -count..<count {
                let gameObject = TriGameObject()
                
                gameObject.position.y = Float(Float(y) + 0.5) / Float(count)
                gameObject.position.x = Float(Float(x) + 0.5) / Float(count)
                gameObject.scale = float3(repeating: 0.1)
                
                addChild(transform: gameObject)
            }
        }
        
        // track input
        let trackerGameObject = GameObject()
        let trackerComponent = InputTrackerComponent()
        trackerGameObject.addComponent(component: trackerComponent)
        addChild(transform: trackerGameObject)
    }
}
