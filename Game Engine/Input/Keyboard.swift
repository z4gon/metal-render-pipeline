// https://github.com/twohyjr/NSView-Keyboard-and-Mouse-Input/blob/master/Keyboard.swift

class Keyboard {
    
    private static var _KEY_COUNT: Int = 256
    private static var _keys = [Bool].init(repeating: false, count: _KEY_COUNT)
    
    public static func setKeyPressed(_ keyCode: UInt16, isOn: Bool) {
        _keys[Int(keyCode)] = isOn
    }
    
    public static func isKeyPressed(_ keyCode: KeyCodes)->Bool{
        return _keys[Int(keyCode.rawValue)]
    }
    
}
