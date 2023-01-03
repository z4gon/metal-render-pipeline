import MetalKit

class TextureCache : Cache<TextureReference, MTLTexture> {
    
    private static var _textures: [String: MTLTexture] = [:]
    
    override class func get(_ textureReference: TextureReference)->MTLTexture{
        
        if(!_textures.keys.contains(textureReference.id)) {
            _textures.updateValue(textureReference.load(), forKey: textureReference.id)
        }
        
        return _textures[textureReference.id]!
    }
}
