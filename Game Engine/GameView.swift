//
//  GameView.swift
//  Game Engine
//
//  Created by z4gon on 11/28/22.
//

import MetalKit

// https://developer.apple.com/documentation/swift/simd3
typealias float2 = SIMD2<Float>
typealias float3 = SIMD3<Float>
typealias float4 = SIMD4<Float>

class GameView: MTKView {
    
    var commandQueue: MTLCommandQueue!
    var renderPipelineState: MTLRenderPipelineState!
    
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!;
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        // device is an abstract representation of the GPU
        // allows to create Metal GPU objects and send them down to the GPU
        self.device = MTLCreateSystemDefaultDevice()
        
        // clearColor fills the screen each time the GPU clears the frame (60 times per second at 60 fps)
        // rgba is 0-1
        self.clearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // how pixels are stored
        self.colorPixelFormat = MTLPixelFormat.bgra8Unorm
        
        // create the command queue to handle commands for the GPU
        self.commandQueue = device?.makeCommandQueue()
        
        createRenderPipelineState()
        
        createVertices()
        createBuffers()
    }
    
    func createVertices() {
        // counter clock wise to define the face
        vertices = [
            Vertex(position: float3(0, 1, 0),   color: float4(0, 0, 1, 1)), // top mid
            Vertex(position: float3(-1, -1, 0), color: float4(0, 1, 0, 1)), // bot left
            Vertex(position: float3(1, -1, 0),  color: float4(1, 0, 0, 1)), // top right
        ]
    }
    
    func createBuffers() {
        let vertexMemSize = Vertex.stride()
        
        vertexBuffer = device?.makeBuffer(bytes: vertices, length: vertexMemSize * vertices.count, options: [])
    }
    
    func createRenderPipelineState(){
        
        // create the descriptor for the render pipeline, make the pixel format match the device
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = MTLPixelFormat.bgra8Unorm
        
        // set the vertex and fragment functions
        let library = device?.makeDefaultLibrary()
        
        // at compile time it will pick the right vertex and shader functions by matching the names
        let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
        
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        
        // set the vertex descriptor
        let vertexDescriptor = MTLVertexDescriptor()
        
        // position
        // - first attribute, metal will use the attributes tags like so [[ attribute(0) ]]
        // - buffer index means the vertices are in the [[ buffer(0) ]] in metal
        // - no offset inside the struct, it's just the first attribute
        vertexDescriptor.attributes[0].format = MTLVertexFormat.float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        // color
        // - second attribute, metal will use the attributes tags like so [[ attribute(1) ]]
        // - buffer index means the vertices are in the [[ buffer(0) ]] in metal
        // - offset inside the struct, needs to be the amount of memory of the position, in bytes
        vertexDescriptor.attributes[1].format = MTLVertexFormat.float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = float3.size()
        
        // layout, how the pipeline state describes the struct
        // https://swiftunboxed.com/internals/size-stride-alignment/
        vertexDescriptor.layouts[0].stride = Vertex.stride()
        
        renderPipelineDescriptor.vertexDescriptor = vertexDescriptor
        
        do {
            // create the render pipeline state using the render pipeline descriptor
            renderPipelineState = try device?.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        // get references if available, else return
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        // cretae a command buffer
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        // create the render command encoder
        // pass the render pass descriptor, which includes pixel information and destination buffers
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        // set the render pipeline state to the render command encoder
        renderCommandEncoder?.setRenderPipelineState(self.renderPipelineState)
        
        // send info to render command encoder
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        // draw a triangle using the vertices in the buffer
        renderCommandEncoder?.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: vertices.count)
        
        // after passing all the data
        renderCommandEncoder?.endEncoding()
        
        // the command buffer will present the result of the rendering when it's done
        commandBuffer?.present(drawable)
        
        // execute the command buffer
        commandBuffer?.commit()
    }
}
