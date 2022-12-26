// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Engine.swift

import MetalKit

class Engine {
    
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func initialize(device: MTLDevice){
        
        // device is an abstract representation of the GPU
        // allows to create Metal GPU objects and send them down to the GPU
        self.device = device
        
        // create the command queue to handle commands for the GPU
        commandQueue = device.makeCommandQueue()
        
        MeshCache.initialize()
        ShaderCache.initialize()
        VertexDescriptorCache.initialize()
        RenderPipelineDescriptorCache.initialize()
        RenderPipelineStateCache.initialize()
    }
}
