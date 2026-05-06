//
//  Calculation.swift
//  Vommit
//
//  Created by Christopher Hardy Gunawan on 03/05/26.
//
import HealthKit

extension HKUnit {
    static func mlPerKgMin() -> HKUnit {
        return HKUnit.literUnit(with: .milli).unitDivided(by: .gramUnit(with: .kilo)).unitDivided(by: .minute())
    }
}
