import MetalKit

class InputTrackerComponent : Component, Updatable {
    
    var time: Float = 0
    
    func doUpdate(deltaTime: Float) {
//        print("getMouseWindowPosition: \(Mouse.getMouseWindowPosition())")
//        print("getMouseViewportPosition: \(Mouse.getMouseViewportPosition())")
        
        if(Keyboard.isKeyPressed(KeyCodes.c)) {
            print("Keyboard.isKeyPressed: \(KeyCodes.c)")
        }
    }
}
