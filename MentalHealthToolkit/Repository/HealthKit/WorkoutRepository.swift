//
//  WorkoutStore.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 20/09/2024.
//

import HealthKit

struct HKWorkoutStore {
    let healthStore = HKHealthStore()
    let workoutType = HKObjectType.workoutType()
    let stepsType = HKObjectType.quantityType(forIdentifier: .stepCount)!
    
    func getStepsAuthorizationStatus() -> HKAuthorizationStatus {
        healthStore.authorizationStatus(for: stepsType)
    }
    func getWorkoutAuthorizationStatus() -> HKAuthorizationStatus {
        healthStore.authorizationStatus(for: workoutType)
    }
    
    func requestAuthorization(for activities: Set<HKSampleType>) async throws {
        if HKHealthStore.isHealthDataAvailable() {
            try await healthStore.requestAuthorization(toShare: activities, read: activities)
        }
    }
    
    func fetchSteps() async -> Int {
        do {
            let startOfDay = Calendar.current.startOfDay(for: .now)
            let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: .now, options: .strictEndDate)
            let totalSteps = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Int, Error>) in
                let query = HKSampleQuery(sampleType: stepsType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let steps = samples as? [HKQuantitySample] {
                        var totalSteps = 0
                        let onlyWatchSteps = steps.filter({ $0.device?.name?.contains("Watch") ?? false })
                        if !onlyWatchSteps.isEmpty {
                            totalSteps = onlyWatchSteps.reduce(0) { (sum, sample) -> Int in
                                return sum + Int(sample.quantity.doubleValue(for: HKUnit.count()))
                            }
                        } else {
                            totalSteps = steps.reduce(0) { (sum, sample) -> Int in
                                return sum + Int(sample.quantity.doubleValue(for: HKUnit.count()))
                            }
                        }
                        continuation.resume(returning: totalSteps)
                    } else {
                        continuation.resume(returning: 0)
                    }
                }
                healthStore.execute(query)
            }
            return totalSteps
        } catch {
            print("Error fetching steps: \(String(describing: error))")
            return 0
        }
    }
    
    func fetchWorkoutsForHome() async -> [HKWorkout] {
        do {
            let workouts = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[HKWorkout], Error>) in
                let sort = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
                let query = HKSampleQuery(sampleType: workoutType, predicate: nil, limit: 2, sortDescriptors: [sort]) { _, results, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let workouts = results as? [HKWorkout] {
                        continuation.resume(returning: workouts)
                    } else {
                        continuation.resume(returning: [])
                    }
                }
                healthStore.execute(query)
            }
            return workouts
        } catch {
            return []
        }
    }
}

