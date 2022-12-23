// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Types.swift

import simd

// https://developer.apple.com/documentation/swift/simd3
typealias float2 = SIMD2<Float>
typealias float3 = SIMD3<Float>
typealias float4 = SIMD4<Float>

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
