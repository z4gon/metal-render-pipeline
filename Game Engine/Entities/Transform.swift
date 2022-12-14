import MetalKit

class Transform {
    public var position: float3 = float3(repeating: 0);
    public var rotation: float3 = float3(repeating: 0);
    public var scale: float3 = float3(repeating: 1);
    
    public var modelMatrix: float4x4 = matrix_identity_float4x4
    
    private var _children: [Transform]! = []
    
    private var _parent: Transform?
    public var parent: Transform? {
        return _parent
    }
    
    public func addChild(_ child: Transform){
        _children.append(child)
        child.setParent(self)
    }
    
    public func setParent(_ parent: Transform){
        _parent = parent
    }
    
    private func updateModelMatrix() {
        var result: float4x4 = matrix_identity_float4x4
        
        result.translate(position: position)
        result.scale(scale: scale)
        
        result.rotateX(angle: rotation.x)
        result.rotateY(angle: rotation.y)
        result.rotateZ(angle: rotation.z)
        
        if(_parent != nil){
            modelMatrix = _parent!.modelMatrix * result
        } else {
            modelMatrix = result
        }
    }
    
    public func earlyUpdate(){
        if let updatableSelf = self as? EarlyUpdatable {
            updatableSelf.doEarlyUpdate()
        }
        
        for child in _children {
            child.earlyUpdate()
        }
    }
    
    public func update(){
        if let updatableSelf = self as? Updatable {
            updatableSelf.doUpdate()
        }
        
        for child in _children {
            child.update()
        }
    }
    
    // https://docs.unity3d.com/ScriptReference/MonoBehaviour.LateUpdate.html
    // LateUpdate is called after all Update functions have been called
    public func lateUpdate(){
        if let updatableSelf = self as? LateUpdatable {
            updatableSelf.doLateUpdate()
        }
        
        updateModelMatrix()
        
        for child in _children {
            child.lateUpdate()
        }
    }
    
    public func render(){
        if let renderableSelf = self as? Renderable {
            renderableSelf.doRender()
        }
        
        for child in _children {
            child.render()
        }
    }
}
