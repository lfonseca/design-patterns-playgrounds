import CoreGraphics

struct Device: CustomStringConvertible {
    var name: String = ""
    var cpu: String = ""
    var storageSpace: Int = 0
    var memory: Int = 0
    var screenResolution: CGSize = .zero
    var hasTouchScreen: Bool = false
    var hasFrontalCamera: Bool = false
    var hasBackCamera: Bool = false
    
    var description: String {
        return """
            \(name) specs:
            - CPU: \(cpu)
            - Storage: \(storageSpace) GB
            - Memory: \(memory) MB
            - Screen Size: \(screenResolution.width)px x \(screenResolution.height)px
            """ +
            "\n- Touch Screen: " + (hasTouchScreen ? "Yes": "No") +
            "\n- Frontal Camera: " + (hasFrontalCamera ? "Yes": "No") +
            "\n- Back Camera: " + (hasBackCamera ? "Yes": "No")
    }
}

protocol DeviceBuilder {
    func reset()
    func add(name: String)
    func add(cpu: String)
    func add(storageSpace: Int)
    func add(memory: Int)
    func add(screenResolution: CGSize)
    func addTouchScreen()
    func addFrontalCamera()
    func addBackCamera()
}

class RealDeviceBuilder: DeviceBuilder {
    private var device: Device
    
    init() {
        self.device = Device()
    }
    
    func reset() {
        device = Device()
    }
    
    func add(name: String) {
        device.name = name
    }
    
    func add(cpu: String) {
        device.cpu = cpu
    }
    
    func add(storageSpace: Int) {
        device.storageSpace = storageSpace
    }
    
    func add(memory: Int) {
        device.memory = memory
    }
    
    func add(screenResolution: CGSize) {
        device.screenResolution = screenResolution
    }
    
    func addTouchScreen() {
        device.hasTouchScreen = true
    }
    
    func addFrontalCamera() {
        device.hasFrontalCamera = true
    }
    
    func addBackCamera() {
        device.hasBackCamera = true
    }
    
    func build() -> Device {
        defer { reset() }
        return device
    }
}

class Apple {
    let builder: DeviceBuilder
    
    init(builder: DeviceBuilder) {
        self.builder = builder
    }
    
    func constructIPhoneXS() {
        builder.add(name: "iPhone XS")
        builder.add(cpu: "A12 Bionic")
        builder.add(storageSpace: 512)
        builder.add(memory: 4096)
        builder.add(screenResolution: CGSize(width: 2436, height: 1125))
        builder.addTouchScreen()
        builder.addFrontalCamera()
        builder.addBackCamera()
    }
    
    func constructMacBookMid2018() {
        builder.add(name: "MacBook Pro (15-inch, mid-2018)")
        builder.add(cpu: "2.2GHz 6-core Intel Core i7")
        builder.add(storageSpace: 1024)
        builder.add(memory: 16384)
        builder.add(screenResolution: CGSize(width: 1920, height: 1200))
        builder.addFrontalCamera()
    }
}

let builder = RealDeviceBuilder()
let apple = Apple(builder: builder)
apple.constructIPhoneXS()
let iphoneXS = builder.build()
apple.constructMacBookMid2018()
let macBookMid2018 = builder.build()

print(iphoneXS)
print(macBookMid2018)
