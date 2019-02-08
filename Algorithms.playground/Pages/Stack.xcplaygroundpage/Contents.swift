
import Foundation

struct Stack<Element> {
    
    fileprivate var array = [Element]()
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n\n"
        let bottomDivider = "\n\n-----------\n"
        
        let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var book = Stack<String>()
book.push("3D Games by Tutorials")
book.push("tvOS Apprentice")
book.push("iOS Apprentice")
book.push("Swift Apprentice")

var num = Stack<Int>()
num.push(1)
num.push(5)
num.push(23)
num.push(16)
num.count
num.isEmpty

print(book)
print(num)
