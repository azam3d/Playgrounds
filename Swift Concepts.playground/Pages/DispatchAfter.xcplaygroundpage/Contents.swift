
import Foundation

class Counter {
    var count = 0
    
    func incrementCount() {
        count += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            print("\(self!.count)")
            
            if self!.count == 10 {
                return
            }
            self?.incrementCount()
        }
    }
}

let counter = Counter()
counter.incrementCount()
