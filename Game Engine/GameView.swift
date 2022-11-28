//
//  GameView.swift
//  Game Engine
//
//  Created by z4gon on 11/28/22.
//

import MetalKit

class GameView: MTKView {
    
    var commandQueue: MTLCommandQueue!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        // device is an abstract representation of the GPU
        // allows to create Metal GPU objects and send them down to the GPU
        self.device = MTLCreateSystemDefaultDevice()
        
        // clearColor fills the screen each time the GPU clears the frame (60 times per second at 60 fps)
        // rgba is 0-1
        self.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1.0)
        
        // how pixels are stored
        self.colorPixelFormat = MTLPixelFormat.bgra8Unorm
        
        // create the command queue to handle commands for the GPU
        self.commandQueue = device?.makeCommandQueue()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        // get references if available, else return
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        // cretae a command buffer
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        // create the render command encoder
        // pass the render pass descriptor, which includes pixel information and destination buffers
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
    }
}
