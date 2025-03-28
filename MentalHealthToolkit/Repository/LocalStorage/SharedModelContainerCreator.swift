//
//  SharedModelContainerCreator.swift
//  HealthJournal
//
//  Created by Santiago Cento on 02/07/2024.
//

import SwiftData

struct SharedModelContainerCreator {
    
    static func create() -> ModelContainer {
        let schema = Schema([HealthyDay.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
