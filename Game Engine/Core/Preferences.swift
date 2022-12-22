// https://github.com/twohyjr/Metal-Game-Engine-Tutorial/blob/Episode6.0_Libraries/Episode6.0_Libraries/Game%20Engine/Core/Preferences.swift

import MetalKit

public enum ClearColors{
    static let White: MTLClearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let Grey: MTLClearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    static let Black: MTLClearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1)
}

class Preferences {
    // clearColor fills the screen each time the GPU clears the frame (60 times per second at 60 fps)
    // rgba is 0-1
    public static var ClearColor: MTLClearColor = ClearColors.White
    
    // how pixels are stored
    public static var PixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
}
