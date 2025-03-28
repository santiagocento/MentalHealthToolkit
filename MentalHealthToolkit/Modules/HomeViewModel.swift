//
//  HomeViewModel.swift
//  HealthJournal
//
//  Created by Santiago Cento on 26/07/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @ObservedObject var model: HealthyDay
    
    init(model: HealthyDay) {
        self.model = model
    }
    
    func getLastDepressionAssessment() -> String {
        guard let score = model.mentalHealth.lastDepressionScore else {
            return LocalizableKey.noPointsRegistered.toString()
        }
        return "\(LocalizableKey.bdi2points.toString())\(score)"
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
}
