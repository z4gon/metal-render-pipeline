// https://github.com/twohyjr/NSView-Keyboard-and-Mouse-Input/blob/master/Mouse.swift

import Cocoa
import simd

enum MouseCodes: Int {
    case left = 0
    case right = 1
    case center = 2
}

class Mouse {
    private static var _MOUSE_BUTTON_COUNT = 12
    private static var _mouseButtonList = [Bool].init(repeating: false, count: _MOUSE_BUTTON_COUNT)
    
    private static var _overallMousePosition = float2(repeating: 0)
    private static var _mousePositionDelta = float2(repeating: 0)
    
    private static var _scrollWheelPosition: Float = 0
    private static var _lastWheelPosition: Float = 0.0
    private static var _scrollWheelChange: Float = 0.0
    
    public static var overrallPosX: Float {
        return _overallMousePosition.x
    }
    
    public static var overrallPosY: Float {
        return _overallMousePosition.y
    }
    
    public static func setMouseButtonPressed(button: Int, isOn: Bool){
        _mouseButtonList[button] = isOn
    }
    
    public static func isMouseButtonPressed(button: MouseCodes)->Bool{
        return _mouseButtonList[Int(button.rawValue)] == true
    }
    
    public static func setOverallMousePosition(position: float2){
        self._overallMousePosition = position
    }
    
    public static func resetMouseDelta(){
        self._mousePositionDelta = float2(repeating: 0)
    }
    
    ///Sets the delta distance the mouse had moved
    public static func setMousePositionChange(overallPosition: float2, deltaPosition: float2){
        self._overallMousePosition = overallPosition
        self._mousePositionDelta += deltaPosition
    }
    
    public static func scrollMouse(deltaY: Float){
        _scrollWheelPosition += deltaY
        _scrollWheelChange += deltaY
    }
    
    //Returns the overall position of the mouse on the current window
    public static func getMouseWindowPosition()->float2{
        return _overallMousePosition
    }
    
    ///Returns the movement of the wheel since last time getDWheel() was called
    public static func getDWheel()->Float{
        let position = _scrollWheelChange
        _scrollWheelChange = 0
        return position
    }
    
    ///Movement on the y axis since last time getDY() was called.
    public static func getDY()->Float{
        let result = _mousePositionDelta.y
        _mousePositionDelta.y = 0
        return result
    }
    
    ///Movement on the x axis since last time getDX() was called.
    public static func getDX()->Float{
        let result = _mousePositionDelta.x
        _mousePositionDelta.x = 0
        return result
    }
    
    //Returns the mouse position in screen-view coordinates [-1, 1]
    public static func getMouseViewportPosition()->float2{
        let x = (_overallMousePosition.x - GameViewRenderer.ScreenSize.x * 0.5) / (GameViewRenderer.ScreenSize.x * 0.5)
        let y = (_overallMousePosition.y - GameViewRenderer.ScreenSize.y * 0.5) / (GameViewRenderer.ScreenSize.y * 0.5)
        return float2(x, y)
    }
    
    public static func getMouseViewportPosition(_ camera: Camera)->float2{
        let viewportPosition = getMouseViewportPosition()
        return float2(viewportPosition.x + camera.gameObject.position.x, viewportPosition.y + camera.gameObject.position.y)
    }
}
