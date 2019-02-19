
import Foundation

var dateString = "28/07/2018 6:00"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yy HH:mm"
dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//dateFormatter.locale =  Locale(identifier: "en_US_POSIX")

let solatDate = dateFormatter.date(from: dateString)
print(solatDate!)
