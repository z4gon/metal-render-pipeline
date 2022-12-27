import MetalKit

extension float4x4 {
    
    mutating func translate(direction: float3) {
        var result = matrix_identity_float4x4
        
        let x = direction.x
        let y = direction.y
        let z = direction.z
        
        result.columns = (
            float4(1, 0, 0, 0),
            float4(0, 1, 0, 0),
            float4(0, 0, 1, 0),
            float4(x, y, z, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
}
