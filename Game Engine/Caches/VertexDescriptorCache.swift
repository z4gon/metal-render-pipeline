// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Libraries/VertexDescriptorLibrary.swift

import MetalKit

enum VertexDescriptorType {
    case Basic
}

class VertexDescriptorCache : Cache<VertexDescriptorType, MTLVertexDescriptor> {
    
    private static var _vertexDescriptors: [VertexDescriptorType: VertexDescriptor] = [:]
    
    override class func fillCache(){
        _vertexDescriptors.updateValue(BasicVertexDescriptor(), forKey: .Basic)
    }
    
    override class func get(_ vertexDescriptorType: VertexDescriptorType)->MTLVertexDescriptor{
        return _vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }

}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

public struct BasicVertexDescriptor : VertexDescriptor{
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor!
    
    init(){
        vertexDescriptor = MTLVertexDescriptor()
        
        // position
        // - first attribute, metal will use the attributes tags like so [[ attribute(0) ]]
        // - buffer index means the vertices are in the [[ buffer(0) ]] in metal
        // - no offset inside the struct, it's just the first attribute
        vertexDescriptor.attributes[0].format = MTLVertexFormat.float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        // normal
        vertexDescriptor.attributes[1].format = MTLVertexFormat.float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = float3.size
        
        // color
        // - second attribute, metal will use the attributes tags like so [[ attribute(1) ]]
        // - buffer index means the vertices are in the [[ buffer(0) ]] in metal
        // - offset inside the struct, needs to be the amount of memory of the position, in bytes
        vertexDescriptor.attributes[2].format = MTLVertexFormat.float4
        vertexDescriptor.attributes[2].bufferIndex = 0
        vertexDescriptor.attributes[2].offset = float3.size + float4.size
        
        // texture coordinate
        vertexDescriptor.attributes[3].format = MTLVertexFormat.float2
        vertexDescriptor.attributes[3].bufferIndex = 0
        vertexDescriptor.attributes[3].offset = float3.size + float4.size + float4.size
        
        // layout, how the pipeline state describes the struct
        // https://swiftunboxed.com/internals/size-stride-alignment/
        vertexDescriptor.layouts[0].stride = Vertex.stride
    }
}
