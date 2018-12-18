
import UIKit

let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
let daysFull = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

//var str = "Mon-Thu, Sun 11:30 am - 10:00 pm"
var str = "Mon, Wed-Sun 11:00 am - 10:00 pm"

let str2 = str.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range: nil).components(separatedBy: .whitespaces)

// find range of days
var dayRange: String!
for day in str2 {
    if day.contains("-") && day.count > 1 {
        print(day)
        dayRange = day
    }
}

var individualDay: String!
for str2 in str2 {
    for day in days {
        if day == str2 {
            individualDay = day
        }
    }
}

let openingHour = str2.filter() { $0 != individualDay! && $0 != dayRange }.joined(separator: " ")

let daySeq = dayRange.split(separator: "-")
let dayIndex1 = days.index(of: String(daySeq[0]))
let dayIndex11 = days.startIndex.distance(to: dayIndex1!)

let dayIndex2 = days.index(of: String(daySeq[1]))
let dayIndex22 = days.startIndex.distance(to: dayIndex2!)

for index in dayIndex11...dayIndex22 {
    print("\(daysFull[index]) \(openingHour)")
}
print("\(individualDay!) \(openingHour)")
