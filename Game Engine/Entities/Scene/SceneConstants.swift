import simd

struct SceneConstants: sizeable{
    var viewMatrix: float4x4 = matrix_identity_float4x4
    var projectionMatrix: float4x4 = matrix_identity_float4x4
    var time: Float = 0
    var cameraPosition: float3 = float3(repeating: 0)
}
