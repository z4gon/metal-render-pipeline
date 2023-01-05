import MetalKit

class FillColorMaterial: Material {
    
    override init() {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.FillColor
    }
}
