import MetalKit

class DebugCameraComponent : Camera {
    
    override func doEarlyUpdate(deltaTime: Float) {
        
        if(Keyboard.isKeyPressed(KeyCodes.upArrow)){
            gameObject.position.y += deltaTime
        }
        
        if(Keyboard.isKeyPressed(KeyCodes.downArrow)){
            gameObject.position.y -= deltaTime
        }
        
        if(Keyboard.isKeyPressed(KeyCodes.leftArrow)){
            gameObject.position.x -= deltaTime
        }
        
        if(Keyboard.isKeyPressed(KeyCodes.rightArrow)){
            gameObject.position.x += deltaTime
        }
            
        super.doEarlyUpdate(deltaTime: deltaTime)
    }
}
