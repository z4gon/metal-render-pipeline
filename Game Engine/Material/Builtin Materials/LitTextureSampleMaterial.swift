import MetalKit

class LitTextureSampleMaterial: TextureSampleMaterial {
    
    override func setFragmentShader(){
        fragmentFunctionName = FragmentFunctionNames.LitTextureSample
    }
}
