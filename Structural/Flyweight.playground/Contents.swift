import UIKit

extension UIColor {
    func toRGBA() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a].map { $0 * 255 }.reduce("", { $0 + String(format: "%02x", Int($1)) })
    }
}

class Particle {
    var color: UIColor
    var texture: String //Just a path for this example
    
    init(color: UIColor, texture: String) {
        self.color = color
        self.texture = texture
    }
}

class ParticleFlyweightFactory {
    private static var flyweightsPool: [String: Particle] = [:]
    
    static func getFlyweight(for color: UIColor, texture: String) -> Particle {
        let flyweightKey = texture + color.toRGBA()
        
        if let availableFlyweight = flyweightsPool[flyweightKey] {
            print("Here is a previous created flyweight for you.")
            return availableFlyweight
        }
        
        print("No flyweights for you now. Creating a new one.")
        
        let newFlyweight = Particle(color: color, texture: texture)
        flyweightsPool[flyweightKey] = newFlyweight
        
        return newFlyweight
    }
}

class MovingParticle {
    private let particleFlyweight: Particle
    private let startPoint: CGPoint
    private let endPoint: CGPoint
    private let speed: CGFloat
    
    init(color: UIColor, texture: String, startPoint: CGPoint, endPoint: CGPoint, speed: CGFloat) {
        self.particleFlyweight = ParticleFlyweightFactory.getFlyweight(for: color, texture: texture)
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.speed = speed
    }
    
    func move() {
        print("Moving from \(startPoint.x), \(startPoint.y) to \(endPoint.x), \(endPoint.y) at \(speed) px/s")
    }
}

let movingDustParticle = MovingParticle(color: .gray, texture: "dust.png", startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 12, y: 8), speed: 18)
movingDustParticle.move()

let anotherMovingDustParticle = MovingParticle(color: .gray, texture: "dust.png", startPoint: CGPoint(x: 4, y: 7), endPoint: CGPoint(x: 23, y: 10), speed: 12)
anotherMovingDustParticle.move()
