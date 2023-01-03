// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Types.swift

struct Vertex: sizeable{
    var position: float3
    var normal: float4
    var color: float4
    var textureCoordinate: float2
    
    init(
        position: float3,
        normal: float4 = float4(repeating: 0),
        color: float4 = float4(repeating: 0),
        textureCoordinate: float2 = float2(repeating: 0)
    ) {
        self.position = position
        self.normal = normal
        self.color = color
        self.textureCoordinate = textureCoordinate
    }
}
