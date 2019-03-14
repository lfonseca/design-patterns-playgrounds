
protocol Car {
    func startEngine()
    func ride()
}

class Ferrari: Car {
    func startEngine() {
        print("Ferrari started its engine")
    }
    
    func ride() {
        print("Ferrari is going really fast")
    }
}

class Corsa: Car {
    func startEngine() {
        print("Corsa started the engine")
    }
    
    func ride() {
        print("Corsa is riding in average speed")
    }
}

protocol CarFactory {
    func createCar() -> Car
    func demonstrateCar()
}

extension CarFactory {
    var car: Car {
        return createCar()
    }
    
    func demonstrateCar() {
        car.startEngine()
        car.ride()
    }
}

class FerrariFactory: CarFactory {
    let ferrari = Ferrari()
    func createCar() -> Car {
        return ferrari
    }
}

class CorsaFactory: CarFactory {
    let corsa = Corsa()
    func createCar() -> Car {
        return corsa
    }
}

class CarShowRoom {
    private let carFactory: CarFactory
    
    init(carFactory: CarFactory) {
        self.carFactory = carFactory
        self.carFactory.demonstrateCar()
    }
}

CarShowRoom(carFactory: FerrariFactory())
CarShowRoom(carFactory: CorsaFactory())
