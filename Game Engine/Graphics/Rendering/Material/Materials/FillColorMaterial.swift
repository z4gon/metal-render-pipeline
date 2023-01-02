import MetalKit

class FillColorMaterial: Material {
    
    private var _color: float4 = float4(repeating: 0)
    
    override init() {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.FillColor
    }
    
    func setColor(_ color: float4) {
        _color = color
    }
    
    override func setGpuValues() {
        
    }
}
