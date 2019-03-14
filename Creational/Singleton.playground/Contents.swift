

final class TheChosen {
    static let one = TheChosen()
    
    private init() {
    }
    
    func fly() {
        print("Neo is flying through the sky")
    }
}

TheChosen.one.fly()
