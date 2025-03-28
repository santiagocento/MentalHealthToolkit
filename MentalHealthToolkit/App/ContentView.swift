//
//  ContentView.swift
//  MentalHealthToolkit
//
//  Created by Santi on 08/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var pathStore: PathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            MentalHealthView(viewModel: MentalHealthViewModel(model: HealthyDay()))
                .navigationDestination(for: BDIAssessment.self) { assessment in BDIAssessmentUIView(viewModel: BDIAssessmentViewModel(assessment: assessment)) }
                .environmentObject(pathStore)
               
        }
    }
}

#Preview {
    ContentView()
}

class PathStore: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")
    
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
