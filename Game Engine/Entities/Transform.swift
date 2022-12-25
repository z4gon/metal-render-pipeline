import MetalKit

class Transform {
    public var children: [Transform]! = []
    
    public func addChildren(transform: Transform){
        children.append(transform)
    }
}
