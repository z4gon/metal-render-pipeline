// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

enum VertexShaderType{
    case Basic
}

enum FragmentShaderType {
    case Basic
}

public struct Shader {
    public var name: String!
    public var functionName: String!
    
    public var function: MTLFunction!
    
    init(name: String, functionName: String){
        self.name = name
        
        // at compile time it will pick the right functions by matching the function name
        self.functionName = functionName
        
        function = ShaderCache.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}
