class Time {
    private static var _totalGameTime: Float = 0.0
    private static var _deltaTime: Float = 0.0
    
    public static var time: Float {
        return _totalGameTime
    }
    
    public static var deltaTime: Float {
        return _deltaTime
    }
    
    public static func updateTime(_ deltaTime: Float){
        _deltaTime = deltaTime
        _totalGameTime += _deltaTime
    }
}
