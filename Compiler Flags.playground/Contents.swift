
// Reference: https://www.swiftbysundell.com/posts/feature-flags-in-swift

// Using compiler flags are better than merging Feature Branch
// - it lets us detect bugs and problems earlier
// - it saves us the pain of having to solve a massive number of merge conflicts
// - it can let us ship a pre-release version of a new feature internally or to beta testers

// Compiler flags lets us mark a code block so that it only gets compiled in if the flag has been set
// To toggle the above flag on or off, we can simply open up our target's build settings in Xcode and add or remove DATABASE_REALM under Swift Compiler - Custom Flags > Active Compilation Condition

class DatabaseFactory {
    func makeDatabase() -> Database {
        #if DATABASE_REALM
            return RealmDatabase()
        #else
            return CoreDataDatabase()
        #endif
    }
}

// Static Flags
struct FeatureFlags {
    static let searchEnabled = false
    static let maximumNumberOfFavorites = 10
    static let allowLandscapeMode = true
}

guard FeatureFlags.searchEnabled else {
    return
}

// Runtime flags
struct FeatureFlags {
    let searchEnabled: Bool
    let maximumNumberOfFavorites: Int
    let allowLandscapeMode: Bool
}
