// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Engine.swift

import MetalKit

class Engine {
    
    public static var Device: MTLDevice!
    public static var CommandQueue: MTLCommandQueue!
    
    public static func Initialize(device: MTLDevice){
        
        // device is an abstract representation of the GPU
        // allows to create Metal GPU objects and send them down to the GPU
        self.Device = device
        
        // create the command queue to handle commands for the GPU
        self.CommandQueue = device.makeCommandQueue()
        
        ShaderLibrary.Initialize()
        VertexDescriptorLibrary.Initialize()
        RenderPipelineDescriptorLibrary.Initialize()
        RenderPipelineStateLibrary.Initialize()
    }
}
