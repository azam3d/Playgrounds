
import Foundation
// https://medium.com/@vishwasng/swift-higher-order-function-and-its-uses-d363eb5cc635

// filter
let numbers = Array(1...100)
let evenNumbers = numbers.filter{ $0 % 2 == 0 }
print(evenNumbers)

// map
let houseName = ["starks" , "lanniesters" , "targaryens" , "baratheon", "arryn"]

func characterCount(house: [String]) -> [Int] {
    var characterCountArray = [Int]()
    for item in house {
        characterCountArray.append(item.count)
    }
    return characterCountArray
}

let houseCharacterCount = characterCount(house: houseName)
print("\nhouseCharacterCount: \(houseCharacterCount)")

let mappedHouseCount = houseName.map { $0.count }
print("mappedHouseCount: \(mappedHouseCount)")

// verify both map result
let check = houseCharacterCount == mappedHouseCount
print("\(check)\n")

let upperCaseHouse = houseName.map { $0.uppercased()}
print("\(upperCaseHouse)\n")

// map with user written function
let numberArray = [2, 5, 10, 15, 20]

extension Int {
    func factorial() -> Int {
        var fact: Int = 1
        for i in 1...self {
            fact = fact * i
        }
        return fact
    }
}

let factorialResult = numberArray.map{ $0.factorial() }
print("\(factorialResult)\n")

// map for boolean decisions
let grade = [30,45,50,100,12,28,46,31,34]
let boolVal = grade.map { $0 >= 35 ? true : false }
print("\(boolVal)\n")

// compactMap
let place: [String?] = ["winterfell" , "highgarden" , "Vale" , "iron islands" , "essos" ,"andalos"]
let printValue = place.compactMap { $0 }
print("\(printValue)\n")

// compactMap to filter nil value
let arrayWithNil: [String?] = ["eleven" , nil , "demogorgon" , nil , "max" , nil , "lucus" , nil , "dustin"]
let filteredNilArray = arrayWithNil.compactMap { $0 }
print(filteredNilArray)
print ("Array with nil = \(arrayWithNil.count) and without nil count = \(filteredNilArray.count)\n")

// compactMap to check on nil
let numArray = ["45" , "60" , "75" , "something random error" , "15" , "Another Error"]
let integerArray = numArray.compactMap{ Int($0) } // if Integer nil, exclude it
print("\(integerArray)\n")

// reduce
// combining the elements of the sequence
let nums = Array(1...5)
let sumOfNumbers = nums.reduce(0, { $0 + $1 } )
print(sumOfNumbers)

let name = ["jon snow" , "Arya Stark" , "Jamie Lanniester" , "Sansa Stark" , "Renly Barathon" , "Catelen Stark" ,"Theon Grayjoy" ,"Ned Stark"]
let nameString = name.reduce("", { $0 + $1.replacingOccurrences(of: " ", with: "")} )
print("type of name : \(type(of: name)), type of nameString:  \(type(of: nameString))\n")

let stringOfNumbers = nums.reduce("", { String($0) + String($1) })
print(stringOfNumbers)

// count all character in an array
let nameArrayCharactersCount = name.reduce(0, { $0 + $1.count })
print(nameArrayCharactersCount)

// find longest name
let longestname = name.reduce(“”, {$0.count > $1.count ? $0 : $1 } )
print(longestname)
