// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Preferences.swift

import MetalKit

class Preferences {
    // clearColor fills the screen each time the GPU clears the frame (60 times per second at 60 fps)
    // rgba is 0-1
    public static var ClearColor: MTLClearColor = ClearColors.White
    
    // how pixels are stored
    public static var PixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    public static var DepthStencilPixelFormat: MTLPixelFormat = MTLPixelFormat.depth32Float
    
    public static var InitialScene: SceneType = SceneType.Sandbox
}
