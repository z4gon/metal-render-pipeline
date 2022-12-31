// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineDescriptorLibrary.swift

import MetalKit

enum RenderPipelineDescriptorType {
    case Basic
}

class RenderPipelineDescriptorCache {
    
    private static var _renderPipelineDescriptors: [RenderPipelineDescriptorType : RenderPipelineDescriptor] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors() {
        _renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .Basic)
    }
    
    public static func getDescriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorType)->MTLRenderPipelineDescriptor{
        return _renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
    
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor{
    var name: String = "Basic Render Pipeline Descriptor"
    
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    
    init(){
        
        // create the descriptor for the render pipeline
        renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        // make the pixel format match the device
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.PixelFormat
        renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.DepthStencilPixelFormat
        
        renderPipelineDescriptor.vertexFunction = VertexShaderCache.get(.Basic)
        renderPipelineDescriptor.fragmentFunction = FragmentShaderCache.get(.Basic)
        
        renderPipelineDescriptor.vertexDescriptor = VertexDescriptorCache.getDescriptor(.Basic)
    }
}
