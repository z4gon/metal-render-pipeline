// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/RenderPipelineStateLibrary.swift

import MetalKit

enum RenderPipelineStateType {
    case Basic
}

class RenderPipelineStateLibrary {
    
    private static var renderPipelineStates: [RenderPipelineStateType: RenderPipelineState] = [:]
    
    public static func Initialize(){
        createDefaultRenderPipelineStates()
    }
    
    private static func createDefaultRenderPipelineStates(){
        
        renderPipelineStates.updateValue(BasicRenderPipelineState(), forKey: .Basic)
        
    }
    
    public static func PipelineState(_ renderPipelineStateType: RenderPipelineStateType)->MTLRenderPipelineState{
        return (renderPipelineStates[renderPipelineStateType]?.renderPipelineState)!
    }
    
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct BasicRenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState {
        var renderPipelineState: MTLRenderPipelineState!
        do{
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.Descriptor(.Basic))
        }catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(name)__::\(error)")
        }
        return renderPipelineState
    }
}
