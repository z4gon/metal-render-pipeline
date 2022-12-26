import MetalKit

protocol Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder)
}
