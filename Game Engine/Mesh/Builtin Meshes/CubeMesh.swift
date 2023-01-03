// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode8.0_Meshes_PlayerObject/Episode8.0_Meshes%26PlayerObject/Game%20Engine/Libraries/MeshLibrary.swift

class CubeMesh : BuiltInMesh{
    override func createMesh() {
        vertices = [
            Vertex(position: float3( 0.5, 0.5, 0.5), color: float4(1,0,0,1)), // FRONT Top Right
            Vertex(position: float3(-0.5, 0.5, 0.5), color: float4(0,1,0,1)), // FRONT Top Left
            Vertex(position: float3(-0.5,-0.5, 0.5), color: float4(0,0,1,1)), // FRONT Bottom Left
            Vertex(position: float3( 0.5,-0.5, 0.5), color: float4(1,0,1,1)),  // FRONT Bottom Right
            
            Vertex(position: float3( 0.5, 0.5, -0.5), color: float4(0,0,1,1)), // BACK Top Right
            Vertex(position: float3(-0.5, 0.5, -0.5), color: float4(1,0,1,1)), // BACK Top Left
            Vertex(position: float3(-0.5,-0.5, -0.5), color: float4(1,0,0,1)), // BACK Bottom Left
            Vertex(position: float3( 0.5,-0.5, -0.5), color: float4(0,1,0,1))  // BACK Bottom Right
        ]
        
        // counter clockwise mean out facing
        indices = [
            
            // FRONT face
            0,1,2,
            0,2,3,
            
            // BACK face
            5,4,7,
            5,7,6,
            
            // TOP face
            4,5,1,
            4,1,0,
            
            // BOTTOM face
            6,7,3,
            6,3,2,
            
            // LEFT face
            1,5,6,
            1,6,2,
            
            // RIGHT face
            4,0,3,
            4,3,7
        ]
    }
}
