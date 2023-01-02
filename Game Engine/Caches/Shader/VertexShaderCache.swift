// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

class VertexShaderCache : Cache<String, MTLFunction> {
    
    private static var _shaders: [String: Shader] = [:]
    
    override class func get(_ vertexFunctionName: String)->MTLFunction{
        
        if(!_shaders.keys.contains(vertexFunctionName)) {
            _shaders.updateValue(Shader(functionName: vertexFunctionName), forKey: vertexFunctionName)
        }
        
        return _shaders[vertexFunctionName]!.function
    }
}
