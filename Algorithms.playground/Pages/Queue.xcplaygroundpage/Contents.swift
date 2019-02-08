
public struct Queue {
    
    var array = [String]()
    
    mutating func enqueue(_ element: String) {
        array.append(element)
    }
    
    mutating func deque() {
        array.remove(at: 0)
    }
    
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return array.joined(separator: "\n")
    }
}

var book = Queue()
book.enqueue("10")
book.enqueue("3")
book.enqueue("57")
//book.deque()
//book.deque()

print(book)
