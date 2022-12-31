// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

class FragmentShaderCache : Cache<FragmentShaderType, MTLFunction> {
    
    private static var _shaders: [FragmentShaderType: Shader] = [:]
    
    override class func fillCache(){
        _shaders.updateValue(Shader(name: "Basic Fragment Shader", functionName: "basic_fragment_shader"), forKey: .Basic)
    }
    
    override class func get(_ fragmentShaderType: FragmentShaderType)->MTLFunction{
        return _shaders[fragmentShaderType]!.function
    }
}
