
// Sequence Based Initialization
let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B", "Barnard's Star", "Wolf 359"]
let nearestStarDistances = [4.24, 4.37, 4.37, 5.96, 7.78]

// Dictionary from sequence of keys-values
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(nearestStarNames, nearestStarDistances))
// ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Proxima Centauri": 4.24, "Alpha Centauri A": 4.37, "Barnard's Star": 5.96]



// Random vote of people's favorite stars
let favoriteStarVotes = ["Alpha Centauri A", "Wolf 359", "Alpha Centauri A", "Barnard's Star"]

// Merging keys with closure for conflicts
let mergedKeysAndValues = Dictionary(zip(favoriteStarVotes, repeatElement(1, count: favoriteStarVotes.count)), uniquingKeysWith: +) // ["Barnard's Star": 1, "Alpha Centauri A": 2, "Wolf 359": 1]



// Filtering results into dictionary rather than array of tuples
let closeStars = starDistanceDict.filter { $0.value < 5.0 }
closeStars // Dictionary: ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37, "Alpha Centauri B": 4.37]

// Mapping values directly resulting in a dictionary
let mappedCloseStars = closeStars.mapValues { "\($0)" }
mappedCloseStars // ["Proxima Centauri": "4.24", "Alpha Centauri A": "4.37", "Alpha Centauri B": "4.37"]



// Subscript with a default value
let siriusDistance = mappedCloseStars["Wolf 359", default: "unknown"] // "unknown"

// Subscript with a default value used for mutating
var starWordsCount: [String: Int] = [:]
for starName in nearestStarNames {
    let numWords = starName.split(separator: " ").count
    starWordsCount[starName, default: 0] += numWords // Amazing
}
starWordsCount // ["Wolf 359": 2, "Alpha Centauri B": 3, "Proxima Centauri": 2, "Alpha Centauri A": 3, "Barnard's Star": 2]



// Grouping sequences by computed key
let starsByFirstLetter = Dictionary(grouping: nearestStarNames) { $0.first! }
starsByFirstLetter



// Improved Set/Dictionary capacity reservation
starWordsCount.capacity  // 6
starWordsCount.reserveCapacity(20) // reserves at _least_ 20 elements of capacity
starWordsCount.capacity // 24



// page 40: Advanced Swift
let mySet: Set<Int> = [1, 2, 2]
dump(mySet)



