// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineDescriptorLibrary.swift

import MetalKit

enum RenderPipelineDescriptorType {
    case Basic
}

class RenderPipelineDescriptorLibrary {
    
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorType : RenderPipelineDescriptor] = [:]
    
    public static func Initialize() {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors() {
        
        renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .Basic)
        
    }
    
    public static func Descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorType)->MTLRenderPipelineDescriptor{
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
    
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor{
    var name: String = "Basic Render Pipeline Descriptor"
    
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        
        // create the descriptor for the render pipeline
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        // make the pixel format match the device
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.PixelFormat
        
        renderPipelineDescriptor.vertexFunction = ShaderLibrary.Vertex(.Basic)
        renderPipelineDescriptor.fragmentFunction = ShaderLibrary.Fragment(.Basic)
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.Descriptor(.Basic)
        
        return renderPipelineDescriptor
    }
}
