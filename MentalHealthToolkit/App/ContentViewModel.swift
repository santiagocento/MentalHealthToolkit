//
//  ContentViewModel.swift
//  MentalHealthToolkit
//
//  Created by Santi on 28/03/2025.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var status: HealthStoreStatus = .loading
    @Published var showSettingsAlert: Bool = false
    
    @MainActor func setup() async {
        let configs = HealthKitConfigurations()
        if await configs.hasToRequestAccess() {
            status = await configs.requestAuthorization() ? .hasDataAccess : .permissionDenied
        } else {
            status = configs.isHealthKitAuthorized() ? .hasDataAccess : .permissionDenied
        }
        showSettingsAlert = status == .permissionDenied
    }
}


