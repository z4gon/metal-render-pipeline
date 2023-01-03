import MetalKit

class TextureDefinition {
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
    
    func createTexture()->Texture {
        return Texture(self)
    }
}
