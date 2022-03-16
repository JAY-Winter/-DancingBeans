class Value{
    
    
    public var globalCountInt: Int = 0
    public var globalOrderMenuList: [String] = []
    
    struct StaticInstance {
        static var instance: Value?
    }
    
    class func sharedInstance() -> Value {
        if (StaticInstance.instance == nil) {
            StaticInstance.instance = Value()
            
        }
        return StaticInstance.instance!
    }
}
