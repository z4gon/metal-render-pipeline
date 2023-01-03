import MetalKit

class TextureLoader {
    private var _textureReference: TextureReference!
    
    init(_ textureReference: TextureReference) {
        _textureReference = textureReference
    }
    
    public func load()->MTLTexture {
        var result: MTLTexture!
        
        guard let url = Bundle.main.url(forResource: _textureReference.name, withExtension: _textureReference.fileExtension) else {
            fatalError("ERROR::LOADING::TEXTURE::__\(_textureReference.name!).\(_textureReference.fileExtension!)__::does not exist")
        }
    
        let loader = MTKTextureLoader(device: Engine.device)
        let options: [MTKTextureLoader.Option: Any] = [MTKTextureLoader.Option.origin : _textureReference.textureLoaderOrigin!]
        
        do {
            result = try loader.newTexture(URL: url, options: options)
            result.label = _textureReference.name
        } catch let error as NSError {
            print("ERROR::LOADING::TEXTURE::__\(_textureReference.name!).\(_textureReference.fileExtension!)__::\(error)")
        }
        
        return result
    }
}
