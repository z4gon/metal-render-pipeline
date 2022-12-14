import MetalKit

enum DepthStencilStateType {
    case Less
}

class DepthStencilStateCache: Cache<DepthStencilStateType, MTLDepthStencilState> {
    
    private static var _depthStencilStates: [DepthStencilStateType: DepthStencilState] = [:]
    
    override class func fillCache(){
        _depthStencilStates.updateValue(LessDepthStencilState(), forKey: .Less)
    }
    
    override class func get(_ depthStencilStateType: DepthStencilStateType)->MTLDepthStencilState{
        return (_depthStencilStates[depthStencilStateType]?.depthStencilState)!
    }
}

protocol DepthStencilState {
    var name: String { get }
    var depthStencilState: MTLDepthStencilState! { get }
}

public struct LessDepthStencilState: DepthStencilState {
    var name: String = "Less DepthTest"
    var depthStencilState: MTLDepthStencilState!
    
    init(){
        
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.depthCompareFunction = MTLCompareFunction.less
        depthStencilDescriptor.isDepthWriteEnabled = true
        
        depthStencilState = Engine.device.makeDepthStencilState(descriptor: depthStencilDescriptor)
    }
}
