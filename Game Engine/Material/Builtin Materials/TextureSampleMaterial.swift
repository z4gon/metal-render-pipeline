import MetalKit

class TextureSampleMaterial: Material {
    
    private var _textureName: String = ""
    
    init(_ textureName: String) {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.TextureSample
        _textureName = textureName
    }
    
    func setTextureName(_ textureName: String) {
        _textureName = textureName
    }
    
    override func setGpuValues() {
//        Graphics.renderCommandEncoder.setFragmentBytes(&_color, length: float4.stride, index: 1)
    }
}
