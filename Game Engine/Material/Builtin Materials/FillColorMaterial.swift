import MetalKit

class FillColorMaterial: Material {
    
    private var _color: float4 = float4(repeating: 0)
    
    init(_ color: float4) {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.FillColor
        _color = color
    }
    
    func setColor(_ color: float4) {
        _color = color
    }
    
    override func setGpuValues() {
        Graphics.renderCommandEncoder.setFragmentBytes(&_color, length: float4.stride, index: 1)
    }
}
