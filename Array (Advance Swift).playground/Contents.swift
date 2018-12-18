
import UIKit

// Variables defined with let are easier to reason about because they are immutable
// This helps greatly when reading through code
let fibs = [0, 1, 1, 2, 3, 5]
//fibs.append(8)
fibs.first
fibs.last
fibs.count

var mutableFibs = [0, 1, 1, 2, 3, 5]
mutableFibs.append(8)
mutableFibs.append(contentsOf: [13, 21])

// Swift arrays have value semantics, which means they are never shared
var x = [1,2,3]
var y = x // makes a copy of x
y.append(4) // will not change x

var squared:[Int] = []
for fib in fibs {
    squared.append(fib * fib)
}
squared

// Map is shorter and clearer
let squared2 = fibs.map{ fib in fib * fib }

// Filter
let t = (1..<10).map{ $0 * $0 }.filter{ $0 % 2 == 0 }
t

// Contains
// Filter create a brand new array and processe every element in the array
// Only ever use filter if you want all the results
let j = (1...100).filter{ $0 % 2 == 0 }.count > 0
j
// This code only needs to check if one element matches
let k = (1...100).contains{ $0 % 2 == 0 }
k

// flatMap
//find in web

// Slices
// Slice type is a view on Array. This makes certain the array doesn't need to get copied
let p = [2, 4, 5, 9]
let q = p[2..<p.endIndex] // is type of ArraySlice.

