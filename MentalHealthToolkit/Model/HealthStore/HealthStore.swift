//
//  HealthStore.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 25/09/2024.
//

import SwiftData
import SwiftUI

@Model
class HealthStore {
    var mentalHealth: MentalHealthStore = MentalHealthStore()
    
    init(mentalHealth: MentalHealthStore = MentalHealthStore()) {
        self.mentalHealth = mentalHealth
    }
}

struct HJHealthStoreEnvironmentKey: EnvironmentKey {
    static var defaultValue: HealthStore = HealthStore()
    
    typealias Value = HealthStore
}

extension EnvironmentValues {
    var hjHealthStore: HealthStore {
        get {
            self[HJHealthStoreEnvironmentKey.self]
        }
        set {
            self[HJHealthStoreEnvironmentKey.self] = newValue
        }
    }
}
