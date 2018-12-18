// https://www.raywenderlich.com/959-arc-and-memory-management-in-swift

class User {
    var name: String
    private(set) var phones: [Phone] = []
    var subcscriptions: [CarrierSubscription] = []
    
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
    
    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
}

class Phone {
    var model: String
    weak var owner: User? //
    var carrierSubscription: CarrierSubscription?
    
    func provision(carrierSubscription: CarrierSubscription) {
        self.carrierSubscription = carrierSubscription
    }
    
    func decommission() {
        self.carrierSubscription = nil
    }
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being deallocated")
    }
}

class CarrierSubscription {
    let name: String
    let countryCode: String
    let number: String
    unowned let user: User //
    
    // closure are reference types
    // the property declared with lazy won't be assigned until it's used the first time
    // this is required because it's using self. countryCode and self.number, which aren't available until after the initializer runs.
    lazy var completePhoneNumber = { [unowned self] in // capture list. self is captured as unowned reference
        return self.countryCode + " " + self.number
    }
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        user.subcscriptions.append(self)
        
        print("CarrierSubscription \(name) is initialized")
    }
    
    deinit {
        print("CarrierSubscription \(name) is being deallocated")
    }
}

do {
    let user1 = User(name: "John")
    let iPhone = Phone(model: "iPhone 6")
    user1.add(phone: iPhone)
    
    let subcscription1 = CarrierSubscription(name: "TelBel", countryCode: "0032", number: "31415926", user: user1)
    iPhone.provision(carrierSubscription: subcscription1)
    print(subcscription1.completePhoneNumber())
}

// A class that generates WWDC Hello greetings.  See http://wwdcwall.com
class WWDCGreeting {
    let who: String
    
    init(who: String) {
        self.who = who
    }
    
//    before
//    lazy var greetingMaker: () -> String = {
//        [unowned self] in
//        return "Hello \(self.who)."
//    }
    
    lazy var greetingMaker: () -> String = {
        [weak self] in
        guard let strongSelf = self else {
            return "No greetings available"
        }
        return "Hello \(strongSelf.who)."
    }
}

let greetingMaker: () -> String

do {
    let mermaid = WWDCGreeting(who: "caffinated mermaid")
    greetingMaker = mermaid.greetingMaker
}

greetingMaker() // TRAP!
