// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

public struct Shader {
    public var function: MTLFunction!
    
    init(functionName: String){
        function = Engine.defaultLibrary.makeFunction(name: functionName)
    }
}
