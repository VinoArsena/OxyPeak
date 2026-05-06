//
//  Exercise.swift
//  Vommit
//
//  Created by Christopher Hardy Gunawan on 05/05/26.
//
import Foundation

struct Exercise {
    let exerciseId: UUID
    let imageSystem: String
    let exerciseName: String
    let exerciseDesc: String
    
    init(imageSystem: String, exerciseName: String, exerciseDesc: String) {
        self.exerciseId = UUID()
        self.imageSystem = imageSystem
        self.exerciseName = exerciseName
        self.exerciseDesc = exerciseDesc
    }
}
