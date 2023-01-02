import MetalKit

class VertexColorMaterial: Material {
    
    override init() {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.VertexColor
    }
    
}
