import Foundation

enum CellType: String {
    case skin
    case blood
    case muscle
    case nerve
}

class Cell: NSCopying, CustomStringConvertible {
    private let type: CellType
    
    var description: String {
        return "I'm a \(type.rawValue) cell"
    }
    
    init(type: CellType) {
        self.type = type
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = Cell(type: self.type)
        return prototype
    }
    
}

let skinCell = Cell(type: .skin)
let clonedCell = skinCell.copy()
let otherClonedCell = skinCell.copy()

print(skinCell)
print(clonedCell)
print(otherClonedCell)
