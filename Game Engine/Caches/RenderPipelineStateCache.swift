// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineStateLibrary.swift

import MetalKit

enum RenderPipelineStateType {
    case Basic
}

class RenderPipelineStateCache : Cache<RenderPipelineStateType, MTLRenderPipelineState> {
    
    private static var _renderPipelineStates: [RenderPipelineStateType: RenderPipelineState] = [:]
    
    override class func fillCache(){
        _renderPipelineStates.updateValue(BasicRenderPipelineState(), forKey: .Basic)
    }
    
    override class func get(_ renderPipelineStateType: RenderPipelineStateType)->MTLRenderPipelineState{
        return (_renderPipelineStates[renderPipelineStateType]?.renderPipelineState)!
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState! { get }
}

public struct BasicRenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState!
    
    init(){
        do{
            renderPipelineState = try Engine.device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorCache.getDescriptor(.Basic))
        }catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(name)__::\(error)")
        }
    }
}
