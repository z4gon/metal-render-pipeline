import MetalKit

class DebugCameraComponent : Camera {
    
    override func doEarlyUpdate() {
        
//        if(Keyboard.isKeyPressed(KeyCodes.upArrow)){
//            gameObject.position.y += deltaTime
//        }
//
//        if(Keyboard.isKeyPressed(KeyCodes.downArrow)){
//            gameObject.position.y -= deltaTime
//        }
//
//        if(Keyboard.isKeyPressed(KeyCodes.leftArrow)){
//            gameObject.position.x -= deltaTime
//        }
//
//        if(Keyboard.isKeyPressed(KeyCodes.rightArrow)){
//            gameObject.position.x += deltaTime
//        }
        
        if(Mouse.isMouseButtonPressed(button: MouseCodes.left)){
            gameObject.position.y += Mouse.getDY() * Time.deltaTime * 0.5
            gameObject.position.x -= Mouse.getDX() * Time.deltaTime * 0.5
        }
        
        gameObject.position.z -= Mouse.getDWheel() * Time.deltaTime * 4
            
        super.doEarlyUpdate()
    }
}
