// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

public struct Shader {
    public var function: MTLFunction!
    
    init(name: String, functionName: String){
        // at compile xcode builds the default library with all the vertex and fragment functions
        function = ShaderCache.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}
