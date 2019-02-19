
import Foundation

protocol ObserveDelegate: class {
    func propertyChanged(newValue: Int)
}

class ObjectToObserve {
    private var foo = 0
    weak var delegate: ObserveDelegate?
    
    func changeFoo() {
        foo += 1
        delegate?.propertyChanged(newValue: foo)
    }
}

class MyObserver: ObserveDelegate {
    var objectToObserve = ObjectToObserve()
    
    init() {
        objectToObserve.delegate = self
    }
    
    func propertyChanged(newValue: Int) {
        print("Value changed: \(newValue)")
    }
}

var myObserver = MyObserver()
myObserver.propertyChanged(newValue: 5)

var objectToObserve = ObjectToObserve()
objectToObserve.changeFoo()
