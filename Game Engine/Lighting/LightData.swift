struct LightData: sizeable {
    var position: float3 = float3(repeating: 0)
    var color: float4 = Colors.White
    var intensity: Float = 1
    var ambient: Float = 0.3
    var range: Float = 0.6
}
