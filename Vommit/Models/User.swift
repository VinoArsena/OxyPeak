import Foundation

enum Gender {
    case male, female, others, notset
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
