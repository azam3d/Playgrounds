
import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct FoodService {
   
    func get(completion: (Result<String>) -> Void) {
        completion(.success(""))
    }
}
