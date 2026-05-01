import Foundation
import SwiftUI

struct Mountain {
    let id: UUID
    let name: String
    let imageUrl: String
    let grade: Int
    let duration: Int
    let elevation: Int
    let distance: Double
    let estimation: Range<Int>
    let overview: String
    let vo2max: Double
    
    init(id: UUID = UUID(), name: String, imageUrl: String, grade: Int, duration: Int, elevation: Int, distance: Double, estimation: Range<Int>, overview: String, vo2max: Double) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.grade = grade
        self.duration = duration
        self.elevation = elevation
        self.distance = distance
        self.estimation = estimation
        self.overview = overview
        self.vo2max = vo2max
    }
}

enum gradeColor {
    case grade1, grade2, grade3, grade4, grade5
    
    var themeColor: Color {
        switch self {
        case .grade1:
            return .brown
        case .grade2:
            return .green
        case .grade3:
            return .blue
        case .grade4:
            return .purple
        case .grade5:
            return .red
        }
    }
}
