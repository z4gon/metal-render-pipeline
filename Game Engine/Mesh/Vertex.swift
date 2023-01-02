// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Types.swift

struct Vertex: sizeable{
    var position: float3
    var color: float4
    var uv: float2
    
    init(
        position: float3,
        color: float4 = float4(repeating: 0),
        uv: float2 = float2(repeating: 0)
    ) {
        self.position = position
        self.color = color
        self.uv = uv
    }
}
