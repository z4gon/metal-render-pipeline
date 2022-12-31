import MetalKit

extension float4x4 {
    
    mutating func translate(position: float3) {
        var result = matrix_identity_float4x4
        
        let x = position.x
        let y = position.y
        let z = position.z
        
        result.columns = (
            float4(1, 0, 0, 0),
            float4(0, 1, 0, 0),
            float4(0, 0, 1, 0),
            float4(x, y, z, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func scale(scale: float3) {
        var result = matrix_identity_float4x4
        
        let x = scale.x
        let y = scale.y
        let z = scale.z
        
        result.columns = (
            float4(x, 0, 0, 0),
            float4(0, y, 0, 0),
            float4(0, 0, z, 0),
            float4(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func rotateX(angle: Float) {
        var result = matrix_identity_float4x4
        
        let s = sin(angle)
        let c = cos(angle)
        
        result.columns = (
            float4(1, 0, 0, 0),
            float4(0, c, s, 0),
            float4(0, -s, c, 0),
            float4(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func rotateY(angle: Float) {
        var result = matrix_identity_float4x4
        
        let s = sin(angle)
        let c = cos(angle)
        
        result.columns = (
            float4(c, 0, -s, 0),
            float4(0, 1, 0, 0),
            float4(s, 0, c, 0),
            float4(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func rotateZ(angle: Float) {
        var result = matrix_identity_float4x4
        
        let s = sin(angle)
        let c = cos(angle)
        
        result.columns = (
            float4(c, s, 0, 0),
            float4(-s, c, 0, 0),
            float4(0, 0, 1, 0),
            float4(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    // https://gamedev.stackexchange.com/questions/120338/what-does-a-perspective-projection-matrix-look-like-in-opengl
    mutating func projectPerspective(fieldOfViewDegrees: Float, aspectRatio: Float, farClippingDistance: Float, nearClippingDistance: Float) {
        var result = matrix_identity_float4x4
        
        let fov = fieldOfViewDegrees.toRadians
        
        let t = tan(fov / 2)
        
        let aspect = aspectRatio
        let far = farClippingDistance
        let near = nearClippingDistance
        
        result.columns = (
            float4(1 / ( aspect * t), 0, 0, 0),
            float4(0, 1 / t, 0, 0),
            float4(0, 0, -((far + near)/(far - near)), -1),
            float4(0, 0, -((2 * far * near)/(far - near)), 0)
        )
        
        self = matrix_multiply(self, result)
    }
}
