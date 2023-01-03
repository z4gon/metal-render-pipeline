import MetalKit

class TextureReference {
    public var name: String!
    public var fileExtension: String! = "jpg"
    public var textureLoaderOrigin: MTKTextureLoader.Origin! = MTKTextureLoader.Origin.topLeft
    
    public var id: String! {
        return "\(name!).\(fileExtension!):\(textureLoaderOrigin!)"
    }
    
    init(
        _ name: String,
        fileExtension: String = "jpg",
        textureLoaderOrigin: MTKTextureLoader.Origin = MTKTextureLoader.Origin.topLeft
    ){
        self.name = name
        self.fileExtension = fileExtension
        self.textureLoaderOrigin = textureLoaderOrigin
    }
    
    func load()->MTLTexture {
        return TextureLoader(self).load()
    }
}
