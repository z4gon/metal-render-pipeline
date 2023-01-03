import MetalKit

class TextureLoader {
    private var _textureDefinition: TextureDefinition!
    
    init(_ textureDefinition: TextureDefinition) {
        _textureDefinition = textureDefinition
    }
    
    public func load()->MTLTexture {
        var result: MTLTexture!
        
        if let url = Bundle.main.url(forResource: _textureDefinition.name, withExtension: _textureDefinition.fileExtension) {
            
            let loader = MTKTextureLoader(device: Engine.device)
            let options: [MTKTextureLoader.Option: Any] = [MTKTextureLoader.Option.origin : _textureDefinition.textureLoaderOrigin]
            
            do {
                result = try loader.newTexture(URL: url, options: options)
                result.label = _textureDefinition.name
            } catch let error as NSError {
                print("ERROR::LOADING::TEXTURE::__\(_textureDefinition.name!).\(_textureDefinition.fileExtension!)__::\(error)")
            }
            
        } else {
            print("ERROR::LOADING::TEXTURE::__\(_textureDefinition.name!).\(_textureDefinition.fileExtension!)__::does not exist")
        }
        
        return result
    }
}
