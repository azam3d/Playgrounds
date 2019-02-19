
import Foundation

for i in 1...10 {
    if i == 4 {
        break
    }
    print("i = \(i)")
}
print("The end")

for i in 1...10 {
    if i == 4 {
        continue
    }
    print("i = \(i)")
}
