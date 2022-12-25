import MetalKit

protocol Component { }

protocol RenderableComponent : Component {
    func render(renderCommandEncoder: MTLRenderCommandEncoder)
}

protocol UpdatableComponent : Component {
    func update(deltaTime: Float)
}
