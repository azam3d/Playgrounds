
class Node {
    var value: String
    var children = [Node]()
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
}

