// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode8.0_Meshes_PlayerObject/Episode8.0_Meshes%26PlayerObject/Game%20Engine/Libraries/MeshLibrary.swift

class QuadMesh : BuiltInMesh{
    override func createMesh() {
        vertices = [
            Vertex(position: float3( 0.5, 0.5,0), textureCoordinate: float2(1,0)), //Top Right
            Vertex(position: float3(-0.5, 0.5,0), textureCoordinate: float2(0,0)), //Top Left
            Vertex(position: float3(-0.5,-0.5,0), textureCoordinate: float2(0,1)), //Bottom Left
            Vertex(position: float3( 0.5,-0.5,0), textureCoordinate: float2(1,1))  //Bottom Right
        ]
        
        indices = [
            0,1,2,
            0,2,3
        ]
    }
}
