import MetalKit

enum BuiltInTexture {
    case MonaLisa
}

class TextureCache : Cache<BuiltInTexture, MTLTexture> {
    
    private static var _textures: [BuiltInTexture: Texture] = [:]
    
    override class func fillCache(){
        _textures.updateValue(Texture("mona-lisa"), forKey: BuiltInTexture.MonaLisa)
    }
    
    override class func get(_ type: BuiltInTexture)->MTLTexture{
        return _textures[type]!.texture
    }
}

class Texture {
    var texture: MTLTexture!
    
    init(
        _ textureName: String,
        fileExtension: String = "jpg",
        textureLoaderOrigin: MTKTextureLoader.Origin = MTKTextureLoader.Origin.topLeft
    ) {
        
        let textureLoader = TextureLoader(
            textureName,
            fileExtension: fileExtension,
            origin: textureLoaderOrigin
        )
        
        texture = textureLoader.load()
    }
}

class TextureLoader {
    private var _name: String!
    private var _fileExtension: String!
    private var _origin: MTKTextureLoader.Origin
    
    init(
        _ name: String,
        fileExtension: String = "png",
        origin: MTKTextureLoader.Origin = MTKTextureLoader.Origin.topLeft
    ) {
        _name = name
        _fileExtension = fileExtension
        _origin = origin
    }
    
    public func load()->MTLTexture {
        var result: MTLTexture!
        
        if let url = Bundle.main.url(forResource: _name, withExtension: _fileExtension) {
            
            let loader = MTKTextureLoader(device: Engine.device)
            let options: [MTKTextureLoader.Option: Any] = [MTKTextureLoader.Option.origin : _origin]
            
            do {
                result = try loader.newTexture(URL: url, options: options)
                result.label = _name
            } catch let error as NSError {
                print("ERROR::LOADING::TEXTURE::__\(_name!).\(_fileExtension!)__::\(error)")
            }
            
        } else {
            print("ERROR::LOADING::TEXTURE::__\(_name!).\(_fileExtension!)__::does not exist")
        }
        
        return result
    }
}
