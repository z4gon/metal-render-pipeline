import MetalKit

class VertexColorMaterial: Material {
    
    override init() {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.VertexColor
    }
    
    // no need to send additional data to the GPU, the vertex color is in the mesh definition
}
