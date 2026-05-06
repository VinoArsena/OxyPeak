import Foundation
import SwiftUI

struct Mountain: Hashable, Identifiable {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var themeColor: Color {
        switch grade {
        case 1: return .brown
        case 2: return .green
        case 3: return .blue
        case 4: return .purple
        case 5: return .red
        default: return .gray
        }
    }
    
    init(name: String, imageUrl: String, grade: Int, duration: Int, elevation: Int, distance: Double, estimation: Range<Int>, overview: String, vo2max: Double) {
        self.id = UUID()
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
