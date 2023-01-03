import MetalKit

class Texture {
    var texture: MTLTexture!
    
    init(_ textureDefinition: TextureDefinition) {
        let textureLoader = TextureLoader(textureDefinition)
        texture = textureLoader.load()
    }
}
