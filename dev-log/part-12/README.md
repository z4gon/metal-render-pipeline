# Part 12: Nested Model Matrices

[Back to Readme](../../README.md)

## References

- [Metal Render Pipeline tutorial series by Rick Twohy](https://www.youtube.com/playlist?list=PLEXt1-oJUa4BVgjZt9tK2MhV_DW7PVDsg)

## Table of Content

- [Implementation](#implementation)
- [Result](#result)

---

## Implementation

The **model matrix** is now located in the **transform** level, and every **lateUpdate**, the transform updates its model matrix.

Each **transform** will check if it has a parent, and will multiply the **parent model matrix** by its **model matrix**, making a new model matrix that takes into account the transformations of the parent.

```swift
class Transform {
    ...

    public var modelMatrix: float4x4 = matrix_identity_float4x4

    private var _parent: Transform?
    public var parent: Transform? {
        return _parent
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
}
```

---

## Result

Now the cube moves along the parent quad.

![Picture](./1.jpg)

![Video](./1.mp4)
