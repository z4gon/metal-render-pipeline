// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

class VertexShaderCache : Cache<VertexShaderType, MTLFunction> {
    
    private static var _shaders: [VertexShaderType: Shader] = [:]
    
    override class func fillCache(){
        _shaders.updateValue(Shader(name: "Basic Vertex Shader", functionName: "basic_vertex_shader"), forKey: .Basic)
    }
    
    override class func get(_ vertexShaderType: VertexShaderType)->MTLFunction{
        return _shaders[vertexShaderType]!.function
    }
}
