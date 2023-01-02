// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineDescriptorLibrary.swift

import MetalKit

public struct RenderPipelineDescriptor{
    private var _renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    public var renderPipelineDescriptor: MTLRenderPipelineDescriptor! {
        return _renderPipelineDescriptor
    }
    
    init(material: Material){
        
        // create the descriptor for the render pipeline
        _renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        
        // make the pixel format match the device
        _renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.PixelFormat
        _renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.DepthStencilPixelFormat
        
        _renderPipelineDescriptor.vertexFunction = VertexShaderCache.get(material.vertexFunctionName)
        _renderPipelineDescriptor.fragmentFunction = FragmentShaderCache.get(material.fragmentFunctionName)
        
        _renderPipelineDescriptor.vertexDescriptor = VertexDescriptorCache.get(.Basic)
    }
}
