import MetalKit

class TextureCache : Cache<TextureDefinition, MTLTexture> {
    
    private static var _textures: [String: Texture] = [:]
    
    override class func get(_ textureDefinition: TextureDefinition)->MTLTexture{
        
        if(!_textures.keys.contains(textureDefinition.id)) {
            _textures.updateValue(textureDefinition.createTexture(), forKey: textureDefinition.id)
        }
        
        return _textures[textureDefinition.id]!.texture
    }
}
