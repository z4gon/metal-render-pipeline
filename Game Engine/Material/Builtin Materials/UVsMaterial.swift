import MetalKit

class UVsMaterial: Material {
    
    override init() {
        super.init()
        fragmentFunctionName = FragmentFunctionNames.UVs
    }
    
    // no need to send additional data to the GPU, the UVs are in the mesh definition
}
