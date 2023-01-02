// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineDescriptorLibrary.swift

import MetalKit

class RenderPipelineDescriptorCache : Cache<Material, MTLRenderPipelineDescriptor> {
    
    private static var _renderPipelineDescriptors: [String : RenderPipelineDescriptor] = [:]
    
    override class func get(_ material: Material)->MTLRenderPipelineDescriptor{
        
        let key = material.renderPipelineStateId
        
        if(!_renderPipelineDescriptors.keys.contains(key)) {
            _renderPipelineDescriptors.updateValue(RenderPipelineDescriptor(material: material), forKey: key)
        }
        
        return _renderPipelineDescriptors[key]!.renderPipelineDescriptor
    }
    
}
