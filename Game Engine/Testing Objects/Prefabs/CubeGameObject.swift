import MetalKit

class CubeGameObject : GameObject {
    
    override init() {
        super.init()
        
        self.addComponent(MeshRenderer(meshReference: BuiltInMeshReference(.Cube), material: VertexColorMaterial()))
        self.addComponent(RotateComponent())
    }
}
