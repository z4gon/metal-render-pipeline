import MetalKit

class Material {
    public var materialData: MaterialData = MaterialData()
    
    public var vertexFunctionName: String = VertexFunctionNames.Basic
    public var fragmentFunctionName: String = FragmentFunctionNames.VertexColor
    
    public var renderPipelineStateId: String {
        return "\(vertexFunctionName)/\(fragmentFunctionName)"
    }
    
    func setColor(_ color: float4){
        materialData.color = color
    }
    
    func setGlossiness(_ glossiness: Float){
        materialData.glossiness = glossiness
    }
    
    func setGpuValues() {
        Graphics.renderCommandEncoder.setFragmentBytes(&materialData, length: MaterialData.stride, index: 0)
    }
}
