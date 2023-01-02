import simd

// https://developer.apple.com/documentation/swift/simd3
typealias float2 = SIMD2<Float>
typealias float3 = SIMD3<Float>
typealias float4 = SIMD4<Float>

extension SIMD2<Float>: sizeable { }
extension SIMD3<Float>: sizeable { }
extension SIMD4<Float>: sizeable { }

extension Float {
    
    var toRadians: Float {
        return (self * 180.0) / Float.pi
    }
    
    var toDegrees: Float {
        return self * (180.0 / Float.pi)
    }
}
