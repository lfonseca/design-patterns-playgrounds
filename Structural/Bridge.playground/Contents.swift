protocol Animal {
    var nature: Nature {get} //This is the bridge
    func speak()
}

protocol Nature {
    func mood() -> String
}

class Dog: Animal {
    private let name: String
    let nature: Nature
    
    init(name: String, nature: Nature) {
        self.name = name
        self.nature = nature
    }
    
    func speak() {
        print("\(name) barks in \(nature.mood()) way")
    }
}

class Cat: Animal {
    private let name: String
    let nature: Nature
    
    init(name: String, nature: Nature) {
        self.name = name
        self.nature = nature
    }
    
    func speak() {
        print("\(name) meows in \(nature.mood()) way")
    }
}

class Calm: Nature {
    func mood() -> String {
        return "calm"
    }
}

class Shy: Nature {
    func mood() -> String {
        return "shy"
    }
}

let calmDog = Dog(name: "Loki", nature: Calm())
calmDog.speak()
let shyCat = Cat(name: "Pancake", nature: Shy())
shyCat.speak()
