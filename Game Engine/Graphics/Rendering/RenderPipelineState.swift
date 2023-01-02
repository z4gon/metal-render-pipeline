// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineStateLibrary.swift

import MetalKit

public struct RenderPipelineState {
    var renderPipelineState: MTLRenderPipelineState!
    
    init(material: Material){
        do{
            renderPipelineState = try Engine.device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorCache.get(material))
        }catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(material.renderPipelineStateId)__::\(error)")
        }
    }
}
