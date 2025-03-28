//
//  MentalHealthToolkitApp.swift
//  MentalHealthToolkit
//
//  Created by Santi on 08/03/2025.
//

import SwiftUI

@main
struct MentalHealthToolkitApp: App {
    @StateObject private var pathStore: NavigationPathStore = NavigationPathStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $pathStore.path) {
                ContentView()
                    .environmentObject(pathStore)
                    .navigationDestination(for: BDIAssessment.self) { BDIAssessmentUIView(viewModel: BDIAssessmentViewModel(assessment: $0)) }
            }
        }
    }
}
