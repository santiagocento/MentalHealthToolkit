//
//  MentalHealthViewModel.swift
//  HealthJournal
//
//  Created by Santiago Cento on 26/07/2024.
//

import SwiftUI

enum MentalHealthViewStatus {
    case loading, permissionDenied, hasDataAccess
}

class MentalHealthViewModel: ObservableObject {
    @ObservedObject var model: HealthyDay
    @Published var status: MentalHealthViewStatus = .loading
    @Published var showSettingsAlert: Bool = false
    
    init(model: HealthyDay) {
        self.model = model
    }
    
    func setup() async {
        let configs = HealthKitConfigurations()
        if await configs.hasToRequestAccess() {
            status = await configs.requestAuthorization() ? .hasDataAccess : .permissionDenied
        } else {
            status = configs.isHealthKitAuthorized() ? .hasDataAccess : .permissionDenied
        }
        showSettingsAlert = status == .permissionDenied
    }
    
    func getLastMindfulSession() async -> String  {
        do {
            if let mindfulSample = try await HealthKitRepository().fetchLatestMindfulSession() {
                return "Duración: \(Int(mindfulSample.endDate.timeIntervalSince(mindfulSample.startDate))) segundos"
            } else {
                return LocalizableKey.couldntObtainInformation.toString()
            }
        } catch {
            debugPrint("Error: \(error.localizedDescription)")
            return LocalizableKey.couldntObtainInformation.toString()
        }
    }
    
    func getLastDepressionAssessment() -> String {
        guard let score = model.mentalHealth.lastDepressionScore else {
            return LocalizableKey.noPointsRegistered.toString()
        }
        return "\(LocalizableKey.bdi2points.toString())\(score)"
    }
    
    func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        print(settingsURL)
        UIApplication.shared.open(settingsURL)
    }
}
