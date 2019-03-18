
class UKFormatSocket {
    func provideUKEnergy() {
        print("\t ⚡️ Providing UK energy ⚡️")
    }
}

class BRFormatSocket {
    func provideBrazilianPower() {
        print("\t ⚡️ Aqui vai energia elétrica brasileira ⚡️")
    }
}

protocol PowerAdapter {
    func providePower() -> Bool
}

class UKPowerAdapter: PowerAdapter {
    let ukPowerProvider: UKFormatSocket
    
    init(ukPowerProvider: UKFormatSocket = UKFormatSocket()) {
        self.ukPowerProvider = ukPowerProvider
    }
    
    func providePower() -> Bool {
        ukPowerProvider.provideUKEnergy()
        return true
    }
}

class BRPowerAdapter: PowerAdapter {
    let brPowerProvider: BRFormatSocket
    
    init(brPowerProvider: BRFormatSocket = BRFormatSocket()) {
        self.brPowerProvider = brPowerProvider
    }
    
    func providePower() -> Bool {
        brPowerProvider.provideBrazilianPower()
        return true
    }
}

class PowerCable {
    private let format: String
    private let adapter: PowerAdapter
    
    init(format: String, adapter: PowerAdapter) {
        self.format = format
        self.adapter = adapter
    }
    
    func getPower() {
        print("Trying to get power in \(format) format")
        if adapter.providePower() {
            print("Got it!")
        }
    }
}

let usPowerCable = PowerCable(format: "US", adapter: UKPowerAdapter())
usPowerCable.getPower()
let anotherUSowerCable = PowerCable(format: "US", adapter: BRPowerAdapter())
anotherUSowerCable.getPower()
