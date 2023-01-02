import MetalKit

enum SamplerStateType {
    case None
    case Linear
}

class SamplerStateCache : Cache<SamplerStateType, MTLSamplerState> {
    
    private static var _samplerStates: [SamplerStateType: SamplerState] = [:]
    
    override class func fillCache(){
        _samplerStates.updateValue(LinearSamplerState(), forKey: SamplerStateType.Linear)
    }
    
    override class func get(_ type: SamplerStateType)->MTLSamplerState{
        return _samplerStates[type]!.samplerState
    }
}

class SamplerState {
    var samplerState : MTLSamplerState!
}

class LinearSamplerState : SamplerState {
    
    override init() {
        super.init()
        
        let samplerDescriptor = MTLSamplerDescriptor()
        
        samplerDescriptor.minFilter = .linear
        samplerDescriptor.magFilter = .linear
        
        samplerState = Engine.device.makeSamplerState(descriptor: samplerDescriptor)
    }
}
