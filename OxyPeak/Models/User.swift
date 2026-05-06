import Foundation

enum Gender: String, CaseIterable {
    case male = "male"
    case female = "female"
    case others = "other"
    case notset = "unknown"
    
    init(from string: String) {
        self = Gender(rawValue: string) ?? .notset
    }
}

struct User {
    var id: UUID
    var name: String
    var dob: Date
    var gender: Gender
    var height: Double
    var weight: Double
    var vo2Max: Double
    
    init(id: UUID = UUID(), name: String, dob: Date, gender: Gender, height: Double, weight: Double, vo2Max: Double) {
        self.id = id
        self.name = name
        self.dob = dob
        self.gender = gender
        self.height = height
        self.weight = weight
        self.vo2Max = vo2Max
    }
}
