
// graphmemes can be of arbitrary length

var family = "👨"
family += "\u{200D}👩"
family += "\u{200D}👧"
family += "\u{200D}👦"

print(family)

family.count

// Swift 4 strings are a collection of characters

let values = "one, two, three"

var i = values.startIndex
while let comma = values[i..<values.endIndex].index(of: ",") {
    if values[i..<comma] == "two" {
        print("found it")
    }
    i = values.index(after: comma)
}

// Split turn String to SubString
let s = "a, b, c"
let sub = s.split(separator: ",")

// Multi-line String Literals
func tellJoke(name: String, character: Character) {
    let punchline = name.filter { $0 != character }
    let n = name.count - punchline.count
    
    let joke = """
        Q: Why does \(name) have \(n) \(character)'s in their name:\n
        A: I don't know, why does \(name) have \(n) \(character)'s in their name\n
        Q: Because otherwise they'd be called \(punchline).
        """
    
    print(joke)
}

tellJoke(name: "Edward Woodward", character: "d")

let galaxy = "Milky Way 🐮"
for char in galaxy {
    print(char)
}

galaxy.count       // 11
galaxy.isEmpty     // false
galaxy.dropFirst() // "ilky Way 🐮"
String(galaxy.reversed()) // "🐮 yaW ykliM"

galaxy.filter { char in
    let isASCII = char.unicodeScalars.reduce(true, { $0 && $1.isASCII })
    return isASCII
} // "Milky Way "

let endIndex = galaxy.index(galaxy.startIndex, offsetBy: 3)
var milkSubstring = galaxy[galaxy.startIndex...endIndex]   // "Milk"
type(of: milkSubstring)   // Substring.Type

// Concatenate a String onto a Substring
milkSubstring += "🥛"     // "Milk🥛"

// Create a String from a Substring
let milkString = String(milkSubstring) // "Milk🥛"

// Grapheme cluster count
"👩‍💻".count // Now: 1, Before: 2
"👍🏽".count // Now: 1, Before: 2
"👨‍❤️‍💋‍👨".count // Now: 1, Before, 4

