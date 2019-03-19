
protocol Notifier {
    func send(message: String)
}

class EmailNotifier: Notifier {
    private let email: String
    
    init(email: String) {
        self.email = email
    }
    
    func send(message: String) {
        print("Sent \"\(message)\" via e-mail to <\(email)>")
    }
}

class BaseDecorator: Notifier {
    private let wrapee: Notifier
    
    init(wrapee: Notifier) {
        self.wrapee = wrapee
    }
    
    func send(message: String) {
        wrapee.send(message: message)
    }
}

class SMSNotifierDecorator: BaseDecorator {
    private let phoneNumber: String
    
    init(wrapee: Notifier, phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(wrapee: wrapee)
    }
    
    override func send(message: String) {
        super.send(message: message)
        print("Sent \"\(message)\" via SMS to \(phoneNumber)")
    }
}

class SlackNotifierDecorator: BaseDecorator {
    private let username: String
    
    init(wrapee: Notifier, username: String) {
        self.username = username
        super.init(wrapee: wrapee)
    }
    
    override func send(message: String) {
        super.send(message: message)
        print("Sent \"\(message)\" via Slack to \(username)")
    }
}

var globalNotifier: Notifier = EmailNotifier(email: "john.doe@mail.com")
globalNotifier = SMSNotifierDecorator(wrapee: globalNotifier, phoneNumber: "202-555-0165")
globalNotifier = SlackNotifierDecorator(wrapee: globalNotifier, username: "john.doe")

globalNotifier.send(message: "Hey!")
