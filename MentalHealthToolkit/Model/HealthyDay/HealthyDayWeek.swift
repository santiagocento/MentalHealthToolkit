//
//  HealthyWeek.swift
//  HealthJournal
//
//  Created by Santiago Cento on 12/07/2024.
//

import Foundation

class HealthyWeek: ObservableObject {
    var days: [HealthyDay]
    
    init(days: [HealthyDay]) {
        self.days = days
    }
}
