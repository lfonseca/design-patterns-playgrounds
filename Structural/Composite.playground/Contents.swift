
protocol Order {
    var cost: Int {get}
}

class Box: Order {
    private var orders: [Order]
    var cost: Int {
        return orders.reduce(1, { $0 + $1.cost })
    }
    
    init() {
        self.orders = []
    }
    
    func add(order: Order) {
        orders.append(order)
    }
}

class Product: Order {
    var cost: Int
    private var name: String
    
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
}

class OrderReceipt {
    private let order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    func price() -> Int {
        return order.cost
    }
}

let phone = Product(name: "Phone", cost: 399)
let headphones = Product(name: "Headphone", cost: 99)
let charger = Product(name: "Charger", cost: 49)

let phoneBox = Box()
phoneBox.add(order: phone)
phoneBox.add(order: charger)

let headphonesBox = Box()
headphonesBox.add(order: headphones)

let order = Box()
order.add(order: phoneBox)
order.add(order: headphonesBox)

let receipt = OrderReceipt(order: order)
print("The total cost of the order is US$\(receipt.price())")
