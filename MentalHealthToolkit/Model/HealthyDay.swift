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
    var lastDepressionScore: Int?
    
    init(date: Date = Calendar.current.startOfDay(for: .now),
         lastDepressionScore: Int? = nil) {
        self.date = date
        self.lastDepressionScore = lastDepressionScore
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        lastDepressionScore = try container.decode(Int.self, forKey: .lastDepressionScore)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(lastDepressionScore, forKey: .lastDepressionScore)
    }
    
    private enum CodingKeys: String, CodingKey {
        case date, lastDepressionScore
    }
}
