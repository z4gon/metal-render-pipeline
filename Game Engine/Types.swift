//
//  Types.swift
//  Game Engine
//
//  Created by z4gon on 12/21/22.
//

import simd

protocol sizeable{
    static func size(_ count: Int)->Int
    static func stride(_ count: Int)->Int
}

// Protocol Extension
// https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID521
extension sizeable{
    static func size()->Int{
        return MemoryLayout<Self>.size
    }
    
    static func stride()->Int{
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int)->Int{
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int)->Int{
        return MemoryLayout<Self>.stride * count
    }
}

extension SIMD3<Float>: sizeable { }

struct Vertex: sizeable{
    var position: float3
    var color: float4
}
