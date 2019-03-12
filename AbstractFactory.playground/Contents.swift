protocol Car {
    func ride()
}

protocol CompactCar: Car {
}

protocol MuscleCar: Car {
    func snoreEngine()
}

protocol SUV: Car {
    func fillTheTrunk()
}

class ChevroletSonic: CompactCar {
    func ride() {
        print("Riding Sonic")
    }
}

class ChevroletImpala: MuscleCar {
    func ride() {
        print("Riding Impala")
    }
    
    func snoreEngine() {
        print("The Impalas engine is snoring very loudly")
    }
}

class ChevroletTrailBlazer: SUV {
    func ride() {
        print("Riding TrailBlazer")
    }
    
    func fillTheTrunk() {
        print("The TrailBlazers trunk is finally full")
    }
}

class FordFiesta: CompactCar {
    func ride() {
        print("Riding Fiesta")
    }
}

class FordMustang: MuscleCar {
    func ride() {
        print("Riding Mustang")
    }
    
    func snoreEngine() {
        print("The Mustangs engine is snoring very loudly")
    }
}

class FordEdge: SUV {
    func ride() {
        print("Riding Edge")
    }
    
    func fillTheTrunk() {
        print("The Edges trunk is finally full")
    }
}

protocol CarsFactory {
    func createCompactCar() -> CompactCar
    func createMuscleCar() -> MuscleCar
    func createSUV() -> SUV
}

class ChevroletCarsFactory: CarsFactory {
    func createCompactCar() -> CompactCar {
        return ChevroletSonic()
    }
    
    func createMuscleCar() -> MuscleCar {
        return ChevroletImpala()
    }
    
    func createSUV() -> SUV {
        return ChevroletTrailBlazer()
    }
}

class FordCarsFactory: CarsFactory {
    func createCompactCar() -> CompactCar {
        return FordFiesta()
    }
    
    func createMuscleCar() -> MuscleCar {
        return FordMustang()
    }
    
    func createSUV() -> SUV {
        return FordEdge()
    }
}

class CarsTestDrive {
    private let compactCar: CompactCar
    private let muscleCar: MuscleCar
    private let suv: SUV
    
    init(carsFactory: CarsFactory) {
        self.compactCar = carsFactory.createCompactCar()
        self.muscleCar = carsFactory.createMuscleCar()
        self.suv = carsFactory.createSUV()
    }
    
    func testCompactCar() {
        compactCar.ride()
    }
    
    func testMuscleCar() {
        muscleCar.ride()
        muscleCar.snoreEngine()
    }
    
    func testSUV() {
        suv.ride()
        suv.fillTheTrunk()
    }
}

let chevroletCarsTestDrive = CarsTestDrive(carsFactory: ChevroletCarsFactory())
chevroletCarsTestDrive.testCompactCar()
chevroletCarsTestDrive.testMuscleCar()
chevroletCarsTestDrive.testSUV()

let fordCarsTestDrive = CarsTestDrive(carsFactory: FordCarsFactory())
fordCarsTestDrive.testCompactCar()
fordCarsTestDrive.testMuscleCar()
fordCarsTestDrive.testSUV()
