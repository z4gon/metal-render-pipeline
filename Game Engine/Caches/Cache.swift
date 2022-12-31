class Cache<EntityType, Entity> {
    
    class func initialize() {
        fillCache()
    }
    
    class func fillCache() {
        // override in sub classes
    }
    
    class func get(_ type: EntityType)->Entity? {
        return nil // override in sub classes
    }
    
}
