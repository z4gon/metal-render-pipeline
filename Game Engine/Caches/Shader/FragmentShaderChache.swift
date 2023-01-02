// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/ShaderLibrary.swift

import MetalKit

class FragmentShaderCache : Cache<String, MTLFunction> {
    
    private static var _shaders: [String: Shader] = [:]
    
    override class func get(_ fragmentFunctionName: String)->MTLFunction{
        
        if(!_shaders.keys.contains(fragmentFunctionName)) {
            _shaders.updateValue(Shader(functionName: fragmentFunctionName), forKey: fragmentFunctionName)
        }
        
        return _shaders[fragmentFunctionName]!.function
    }
}
