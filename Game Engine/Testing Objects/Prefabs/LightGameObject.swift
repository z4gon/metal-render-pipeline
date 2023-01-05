import MetalKit

class LightGameObject : GameObject {
    
    init(
        position: float3 = float3(0.3, 0.3, 0.3),
        color: float4 = Colors.White,
        intensity: Float = 5,
        ambient: Float = 0.1,
        range: Float = 1
    ) {
        super.init()
        
        self.position = position
        scale = float3(repeating: 0.02)
        
        // sphere
        let material = FillColorMaterial()
        material.setColor(color)
        addComponent(
            MeshRenderer(
                meshReference: ModelMeshReference("sphere"),
                material: material
            )
        )
        
        // light
        let lightComponent = Light()
        lightComponent.color = color
        lightComponent.intensity = intensity
        lightComponent.ambient = ambient
        lightComponent.range = range
        
        addComponent(lightComponent)
    }
    
}
