// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode8.0_Meshes_PlayerObject/Episode8.0_Meshes%26PlayerObject/Game%20Engine/Libraries/MeshLibrary.swift

import MetalKit

class MeshCache : Cache<MeshReference, Mesh> {
    
    private static var _meshes: [String: Mesh] = [:]
    
    override class func get(_ meshReference: MeshReference)->Mesh{
        
        if(!_meshes.keys.contains(meshReference.id)) {
            _meshes.updateValue(meshReference.load(), forKey: meshReference.id)
        }
        
        return _meshes[meshReference.id]!
    }
}
