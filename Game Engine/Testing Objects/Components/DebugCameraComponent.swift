import MetalKit

class DebugCameraComponent : Camera {
    
    override func doEarlyUpdate() {
        
        if(Keyboard.isKeyPressed(KeyCodes.w)){
            gameObject.position.y += Time.deltaTime
        }

        if(Keyboard.isKeyPressed(KeyCodes.s)){
            gameObject.position.y -= Time.deltaTime
        }

        if(Keyboard.isKeyPressed(KeyCodes.a)){
            gameObject.position.x -= Time.deltaTime
        }

        if(Keyboard.isKeyPressed(KeyCodes.d)){
            gameObject.position.x += Time.deltaTime
        }
        
        if(Mouse.isMouseButtonPressed(button: MouseCodes.left)){
            gameObject.rotation.x += Mouse.getDY() * Time.deltaTime * 0.5
            gameObject.rotation.y += Mouse.getDX() * Time.deltaTime * 0.5
        }
        
        gameObject.position.z -= Mouse.getDWheel() * Time.deltaTime * 4
            
        super.doEarlyUpdate()
    }
}
