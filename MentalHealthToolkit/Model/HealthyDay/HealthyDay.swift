//
//  FullDayNutrition.swift
//  HealthJournal
//
//  Created by Santiago Cento on 30/06/2024.
//

import Foundation
import SwiftData

@Model
class HealthyDay: ObservableObject {
    var date: Date = Calendar.current.startOfDay(for: .now)
    @Relationship
    var mentalHealth: MentalHealth = MentalHealth()
    
    init(date: Date = Calendar.current.startOfDay(for: .now),
         mentalHealth: MentalHealth = MentalHealth()) {
        self.date = date
        self.mentalHealth = mentalHealth
    }
    
    func getMentalProgress() -> Float {
        return mentalHealth.worldInteraction ? 1 : 0
    }
}

class HealthyDaysRecords: ObservableObject {
    @Published var days: [HealthyDay]
    
    init(days: [HealthyDay]) {
        self.days = days
    }
}
