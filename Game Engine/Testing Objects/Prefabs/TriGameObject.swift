import MetalKit

class TriGameObject : GameObject {
    
    override init() {
        super.init()
        
        let meshRenderer = MeshRenderer(mesh: MeshCache.getMesh(.Quad))
        self.addComponent(component: meshRenderer)
        
        let faceMouseComponent = FaceMouseComponent()
        self.addComponent(component: faceMouseComponent)
    }
}
