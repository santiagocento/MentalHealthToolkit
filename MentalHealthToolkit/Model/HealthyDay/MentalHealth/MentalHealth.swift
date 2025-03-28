//
//  MentalHealth.swift
//  HealthJournal
//
//  Created by Santiago Cento on 12/07/2024.
//

import Foundation

struct MentalHealth: Codable {
    var worldInteraction: Bool
    var lastDepressionScore: Int?
    
    init(worldInteraction: Bool = false, lastDepressionScore: Int? = nil) {
        self.worldInteraction = worldInteraction
        self.lastDepressionScore = lastDepressionScore
    }
}
