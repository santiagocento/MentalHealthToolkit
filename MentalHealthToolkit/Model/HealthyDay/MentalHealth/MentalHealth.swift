//
//  MentalHealth.swift
//  HealthJournal
//
//  Created by Santiago Cento on 12/07/2024.
//

import Foundation

struct MentalHealth: Codable {
    var lastDepressionScore: Int?
    
    init(lastDepressionScore: Int? = nil) {
        self.lastDepressionScore = lastDepressionScore
    }
}
