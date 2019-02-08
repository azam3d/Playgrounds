
// Memoization is a technique in which we store the results of computational tasks when they are completed

import Foundation

func fib1(n: Int) -> Int {
    if n < 2 {
        return n
    }
    return fib1(n: n-1) + fib1(n: n-2)
}
print("\n-- Fib 1---")
for num in 0...9 {
    print(fib1(n: num))
}

var fibMemo: [Int: Int] = [0: 0, 1: 1]

func fib2(n: Int) -> Int {
    if let result = fibMemo[n] {
        return result
    } else {
        fibMemo[n] = fib2(n: n-1) + fib2(n: n-2)
    }
    return fibMemo[n]!
}
print("\n-- Fib 2---")
for num in 0...9 {
    print(fib2(n: num))
}

// Pattern Matching
// let triple = (1, 2, 3)
// let (x, y, z) = triple
func fib3(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    var last = 0
    var next = 1
    
    for _ in 1..<n {
        (last, next) = (next, last + next)
    }
    return next
}

print("\n-- Fib 3---")
for num in 0...9 {
    print(fib3(n: num))
}
