
import Foundation

func test(_ completion: (String) -> ()) {
    completion("success")
}

test() { print($0) }
