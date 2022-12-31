class Cache<EntityType, Entity> {
    
    func initialize() {
        fillCache()
    }
    
    func fillCache() {
        // override in sub classes
    }
    
    func getEntity(_ type: EntityType)->Entity? {
        return nil // override in sub classes
    }
    
}
