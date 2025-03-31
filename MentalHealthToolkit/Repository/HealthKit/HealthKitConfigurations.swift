//
//  HealthKitConfigurations.swift
//  HealthJournal
//
//  Created by Santiago Cento on 25/07/2024.
//

import HealthKit

struct HealthKitConfigurations {
    let healthStore = HKHealthStore()
    
    let allCategoriesTypes: Set = [
        HKCategoryType(.mindfulSession),
        HKCategoryType(.sleepAnalysis),
        HKObjectType.workoutType(),
        HKObjectType.stateOfMindType(),
        HKQuantityType.workoutType(),
        HKQuantityType(.activeEnergyBurned),
        HKQuantityType(.basalEnergyBurned),
        HKQuantityType(.stepCount),
    ]
    
    func getBiologicalSex() -> HKBiologicalSex {
        do {
            return try healthStore.biologicalSex().biologicalSex
        } catch {
            return .notSet
        }
    }
    
    func isHealthKitAuthorized() -> Bool {
        guard HKHealthStore.isHealthDataAvailable() else { return false }
        
        return allCategoriesTypes.allSatisfy { healthStore.authorizationStatus(for: $0) == .sharingAuthorized }
    }
    
    func hasToRequestAccess() async -> Bool {
        let hasToRequest = await withCheckedContinuation { continuation in
            healthStore.getRequestStatusForAuthorization(toShare: allCategoriesTypes, read: allCategoriesTypes) { (status, error) in
                continuation.resume(returning: status == .shouldRequest)
           }
        }
        return hasToRequest
    }
    
    func requestAuthorization() async -> Bool {
        let result = await withCheckedContinuation({ continuation in
            healthStore.requestAuthorization(toShare: allCategoriesTypes, read: allCategoriesTypes) { (result, error) in
                continuation.resume(returning: result)
            }
        })

        return result ? isHealthKitAuthorized() : false
    }
}
