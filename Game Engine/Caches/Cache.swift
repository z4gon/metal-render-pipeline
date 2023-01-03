class Cache<Key, Entity> {
    
    class func initialize() {
        fillCache()
    }
    
    class func fillCache() {
        // override in sub classes
    }
    
    class func get(_ key: Key)->Entity? {
        return nil // override in sub classes
    }
    
}
