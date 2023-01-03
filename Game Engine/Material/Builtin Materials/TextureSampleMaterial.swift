import MetalKit

class TextureSampleMaterial: Material {
    
    private var _textureDefinition: TextureDefinition!
    
    init(_ textureDefinition: TextureDefinition) {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.TextureSample
        setTextureDefinition(textureDefinition)
    }
    
    func setTextureDefinition(_ textureDefinition: TextureDefinition) {
        _textureDefinition = textureDefinition
    }
    
    override func setGpuValues() {
        Graphics.renderCommandEncoder.setFragmentSamplerState(SamplerStateCache.get(.Linear), index: 0)
        Graphics.renderCommandEncoder.setFragmentTexture(TextureCache.get(_textureDefinition), index: 0)
    }
}
