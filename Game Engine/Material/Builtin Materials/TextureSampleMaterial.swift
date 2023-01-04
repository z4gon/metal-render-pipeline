import MetalKit

class TextureSampleMaterial: Material {
    
    private var _textureReference: TextureReference!
    
    init(_ textureReference: TextureReference) {
        super.init()
        setFragmentShader()
        setTextureReference(textureReference)
    }
    
    func setFragmentShader(){
        fragmentFunctionName = FragmentFunctionNames.TextureSample
    }
    
    func setTextureReference(_ textureReference: TextureReference) {
        _textureReference = textureReference
    }
    
    override func setGpuValues() {
        Graphics.renderCommandEncoder.setFragmentSamplerState(SamplerStateCache.get(.Linear), index: 0)
        Graphics.renderCommandEncoder.setFragmentTexture(TextureCache.get(_textureReference), index: 0)
    }
}
