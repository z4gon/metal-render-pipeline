import MetalKit

class TextureSampleMaterial: Material {
    
    private var _textureType: BuiltInTexture!
    
    init(_ textureType: BuiltInTexture) {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.TextureSample
        setTextureType(textureType)
    }
    
    func setTextureType(_ textureType: BuiltInTexture) {
        _textureType = textureType
    }
    
    override func setGpuValues() {
        Graphics.renderCommandEncoder.setFragmentSamplerState(SamplerStateCache.get(.Linear), index: 0)
        Graphics.renderCommandEncoder.setFragmentTexture(TextureCache.get(_textureType), index: 0)
    }
}
