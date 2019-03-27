protocol Account {
    func showCurrentBalance()
}

class UserAccount: Account {
    func showCurrentBalance() {
        print("Your current balance is: $2000,00")
    }
}

class ProtectedAccount: Account {
    private let username: String
    private let userAccount: UserAccount
    
    init(username: String) {
        self.username = username
        self.userAccount = UserAccount()
    }
    
    func showCurrentBalance() {
        if username == "authorized-user" {
            userAccount.showCurrentBalance()
        } else {
            print("Sorry... you don't have permission to access this account")
        }
    }
}

let unauthorizedUserAccount = ProtectedAccount(username: "some-user")
unauthorizedUserAccount.showCurrentBalance()

let authorizedUserAccount = ProtectedAccount(username: "authorized-user")
authorizedUserAccount.showCurrentBalance()
