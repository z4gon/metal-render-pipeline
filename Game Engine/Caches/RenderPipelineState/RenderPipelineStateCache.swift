// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineStateLibrary.swift

import MetalKit

class RenderPipelineStateCache : Cache<Material, MTLRenderPipelineState> {
    
    private static var _renderPipelineStates: [String: RenderPipelineState] = [:]

    override class func get(_ material: Material)->MTLRenderPipelineState{
        
        let key = material.renderPipelineStateId
        
        if(!_renderPipelineStates.keys.contains(key)) {
            _renderPipelineStates.updateValue(RenderPipelineState(material: material), forKey: key)
        }
        
        return _renderPipelineStates[key]!.renderPipelineState
    }
}
