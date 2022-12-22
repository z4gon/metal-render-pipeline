//
//  Types.swift
//  Game Engine
//
//  Created by z4gon on 12/21/22.
//

import simd

protocol sizeable{}

// Protocol Extension
// https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID521
extension sizeable{
    static var size: Int{
        return MemoryLayout<Self>.size
    }
    
    static var stride: Int{
        return MemoryLayout<Self>.stride
    }
}

extension SIMD3<Float>: sizeable { }

struct Vertex: sizeable{
    var position: float3
    var color: float4
}
