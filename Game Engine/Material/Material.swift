import MetalKit

class Material {
    public var vertexFunctionName: String = VertexFunctionNames.Basic
    public var fragmentFunctionName: String = FragmentFunctionNames.VertexColor
    
    public var renderPipelineStateId: String {
        return "\(vertexFunctionName)/\(fragmentFunctionName)"
    }
    
    func setGpuValues() {}
}
