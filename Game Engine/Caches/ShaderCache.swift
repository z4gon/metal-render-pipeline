// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

enum VertexShaderType{
    case Basic
}

enum FragmentShaderType {
    case Basic
}

class ShaderCache {
    
    public static var DefaultLibrary: MTLLibrary!
    
    private static var _vertexShaders: [VertexShaderType: Shader] = [:]
    private static var _fragmentShaders: [FragmentShaderType: Shader] = [:]
    
    public static func Initialize(){
        DefaultLibrary = Engine.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    private static func createDefaultShaders(){
        _vertexShaders.updateValue(Shader(name: "Basic Vertex Shader", functionName: "basic_vertex_shader"), forKey: .Basic)
        _fragmentShaders.updateValue(Shader(name: "Basic Fragment Shader", functionName: "basic_fragment_shader"), forKey: .Basic)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderType)->MTLFunction{
        return _vertexShaders[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderType: FragmentShaderType)->MTLFunction{
        return _fragmentShaders[fragmentShaderType]!.function
    }
}

public struct Shader {
    public var name: String!
    public var functionName: String!
    
    public var function: MTLFunction!
    
    init(name: String, functionName: String){
        self.name = name
        
        // at compile time it will pick the right functions by matching the function name
        self.functionName = functionName
        
        self.function = ShaderCache.DefaultLibrary.makeFunction(name: functionName)
        self.function?.label = name
    }
}
