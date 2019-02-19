
import Foundation

class Singleton {
    static let shared = Singleton()
    
    private init() {}
    
    func fizz() {
        print("Fizz")
    }
}

Singleton.shared.fizz()
