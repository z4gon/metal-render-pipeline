// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

class ShaderCache {
    
    public static var defaultLibrary: MTLLibrary!
    
    private static var _vertexShaders: [VertexShaderType: Shader] = [:]
    private static var _fragmentShaders: [FragmentShaderType: Shader] = [:]
    
    public static func initialize(){
        defaultLibrary = Engine.device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    private static func createDefaultShaders(){
        _vertexShaders.updateValue(Shader(name: "Basic Vertex Shader", functionName: "basic_vertex_shader"), forKey: .Basic)
        _fragmentShaders.updateValue(Shader(name: "Basic Fragment Shader", functionName: "basic_fragment_shader"), forKey: .Basic)
    }
    
    public static func getVertexFunction(_ vertexShaderType: VertexShaderType)->MTLFunction{
        return _vertexShaders[vertexShaderType]!.function
    }
    
    public static func getFragmentFunction(_ fragmentShaderType: FragmentShaderType)->MTLFunction{
        return _fragmentShaders[fragmentShaderType]!.function
    }
}
