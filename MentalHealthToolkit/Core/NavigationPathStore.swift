//
//  PathStore.swift
//  MentalHealthToolkit
//
//  Created by Santi on 28/03/2025.
//

import SwiftUI

class NavigationPathStore: ObservableObject {
    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
