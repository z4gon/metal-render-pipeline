import MetalKit

class LightGameObject : GameObject {
    
    init(
        position: float3 = float3(0.5, 0.5, 0),
        color: float4 = Colors.White,
        intensity: Float = 5,
        ambient: Float = 0.4
    ) {
        super.init()
        
        self.position = position
        scale = float3(repeating: 0.05)
        
        // sphere
        addComponent(
            MeshRenderer(
                meshReference: ModelMeshReference("sphere"),
                material: FillColorMaterial(color)
            )
        )
        
        // light
        let lightComponent = Light()
        lightComponent.color = color
        lightComponent.intensity = intensity
        lightComponent.ambient = ambient
        
        addComponent(lightComponent)
    }
    
}
