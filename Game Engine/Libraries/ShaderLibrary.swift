// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

enum VertexShaderType{
    case Basic
}

enum FragmentShaderType {
    case Basic
}

class ShaderLibrary {
    
    public static var DefaultLibrary: MTLLibrary!
    
    private static var vertexShaders: [VertexShaderType: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderType: Shader] = [:]
    
    public static func Initialize(){
        DefaultLibrary = Engine.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders(){
        // Vertex Shaders
        vertexShaders.updateValue(BasicVertexShader(), forKey: .Basic)
        
        // Fragment Shaders
        fragmentShaders.updateValue(BasicFragmentShader(), forKey: .Basic)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderType)->MTLFunction{
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderType: FragmentShaderType)->MTLFunction{
        return fragmentShaders[fragmentShaderType]!.function
    }
    
}

protocol Shader{
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

public struct BasicVertexShader: Shader {
    public var name: String = "Basic Vertex Shader"
    
    // at compile time it will pick the right functions by matching the names
    public var functionName: String = "basic_vertex_shader"
    
    public var function: MTLFunction {
        let function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}

public struct BasicFragmentShader: Shader {
    public var name: String = "Basic Fragment Shader"
    
    // at compile time it will pick the right functions by matching the names
    public var functionName: String = "basic_fragment_shader"
    
    public var function: MTLFunction {
        let function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}
