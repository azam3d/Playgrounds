
import Foundation
    
func bubbleSort(_ array: [Int]) -> [Int] {
    var array = array
    
    for _ in 0...array.count {
        for j in 1...array.count - 1 {
            if array[j-1] > array[j] {
                let largerValue = array[j-1]
                array[j-1] = array[j]
                array[j] = largerValue
            }
        }
    }
    return array
}

let numbers = [3,4,5,1,0,8,1]
bubbleSort(numbers) // [0, 1, 1, 3, 4, 5, 8]
