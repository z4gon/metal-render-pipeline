import MetalKit

class Transform {
    public var position: float3 = float3(repeating: 0);
    public var rotation: float3 = float3(repeating: 0);
    public var scale: float3 = float3(repeating: 1);
    
    public var children: [Transform]! = []
    
    public func addChild(transform: Transform){
        children.append(transform)
    }
    
    public func earlyUpdate(deltaTime: Float){
        for child in children {
            child.earlyUpdate(deltaTime: deltaTime)
        }
        
        if let updatableSelf = self as? EarlyUpdatable {
            updatableSelf.doEarlyUpdate(deltaTime: deltaTime)
        }
    }
    
    public func update(deltaTime: Float){
        for child in children {
            child.update(deltaTime: deltaTime)
        }
        
        if let updatableSelf = self as? Updatable {
            updatableSelf.doUpdate(deltaTime: deltaTime)
        }
    }
    
    // https://docs.unity3d.com/ScriptReference/MonoBehaviour.LateUpdate.html
    // LateUpdate is called after all Update functions have been called
    public func lateUpdate(deltaTime: Float){
        for child in children {
            child.lateUpdate(deltaTime: deltaTime)
        }
        
        if let updatableSelf = self as? LateUpdatable {
            updatableSelf.doLateUpdate(deltaTime: deltaTime)
        }
    }
    
    public func render(renderCommandEncoder: MTLRenderCommandEncoder){
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        
        if let renderableSelf = self as? Renderable {
            renderableSelf.doRender(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
