// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode8.0_Meshes_PlayerObject/Episode8.0_Meshes%26PlayerObject/Game%20Engine/Libraries/MeshLibrary.swift

import MetalKit

class MeshCache : Cache<MeshType, Mesh> {
    
    private static var _meshes: [MeshType: Mesh] = [:]
    
    override class func fillCache(){
        _meshes.updateValue(TriangleMesh(), forKey: .Triangle)
        _meshes.updateValue(QuadMesh(), forKey: .Quad)
        _meshes.updateValue(CubeMesh(), forKey: .Cube)
    }
    
    override class func get(_ meshType: MeshType)->Mesh{
        return _meshes[meshType]!
    }
}
