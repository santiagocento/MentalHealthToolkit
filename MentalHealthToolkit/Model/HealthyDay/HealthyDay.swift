//
//  FullDayNutrition.swift
//  HealthJournal
//
//  Created by Santiago Cento on 30/06/2024.
//

import Foundation
import SwiftData

@Model
class HealthyDay: ObservableObject, Codable {
    var date: Date = Calendar.current.startOfDay(for: .now)
    @Relationship
    var mentalHealth: MentalHealth = MentalHealth()
    
    init(date: Date = Calendar.current.startOfDay(for: .now),
         mentalHealth: MentalHealth = MentalHealth()) {
        self.date = date
        self.mentalHealth = mentalHealth
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        mentalHealth = try container.decode(MentalHealth.self, forKey: .mentalHealth)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(mentalHealth, forKey: .mentalHealth)
    }
    
    private enum CodingKeys: String, CodingKey {
        case date, mentalHealth
    }
}

class HealthyDaysRecords: ObservableObject {
    @Published var days: [HealthyDay]
    
    init(days: [HealthyDay]) {
        self.days = days
    }
}
