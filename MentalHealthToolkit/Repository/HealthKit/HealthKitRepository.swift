//
//  HealthKitRepository.swift
//  HealthJournal
//
//  Created by Santiago Cento on 26/07/2024.
//

import HealthKit

struct HealthKitRepository {
    
    let healthStore = HKHealthStore()
    
    func fetchLatestMindfulSession() async throws -> HKCategorySample? {
        guard HKHealthStore.isHealthDataAvailable() else {
            throw HealthKitError.dataNotAvailable
        }
        guard let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) else {
            throw HealthKitError.typeNotAvailable
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(sampleType: mindfulType, predicate: nil, limit: 1, sortDescriptors: nil) { (query, samples, error) in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                if let sample = samples?.first as? HKCategorySample {
                    continuation.resume(returning: sample)
                } else {
                    continuation.resume(returning: nil)
                }
            }
            healthStore.execute(query)
        }
    }
    
    func fetchLastSleepData() async throws -> HKCategorySample? {
        guard let  sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            throw HealthKitError.typeNotAvailable
        }
        
        let calendar = Calendar.current
        let now = Date()

        let startOfPreviousNight = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: now.addingTimeInterval(-86400))!
        let endOfPreviousNight = calendar.date(bySettingHour: 10, minute: 0, second: 0, of: now)!

        let predicate = HKQuery.predicateForSamples(withStart: startOfPreviousNight, end: endOfPreviousNight, options: .strictStartDate)
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            guard let samples = samples as? [HKCategorySample] else {
                // Handle no data available
                return
            }

            let filteredSamples = samples.filter { sample in
                let source = sample.sourceRevision.source.bundleIdentifier
                return source.starts(with: "com.apple.health")
            }

            var remSleepSeconds: TimeInterval = 0
            var deepSleepSeconds: TimeInterval = 0
            var coreSleepSeconds: TimeInterval = 0
            var awakeningsCount = 0
            var totalSleepSeconds: TimeInterval = 0

            for sample in filteredSamples {
                let value = sample.value
                let duration = sample.endDate.timeIntervalSince(sample.startDate)

                switch value {
                case HKCategoryValueSleepAnalysis.asleepREM.rawValue:
                    remSleepSeconds += duration
                case HKCategoryValueSleepAnalysis.asleepCore.rawValue:
                    coreSleepSeconds += duration
                case HKCategoryValueSleepAnalysis.asleepDeep.rawValue:
                    deepSleepSeconds += duration
                case HKCategoryValueSleepAnalysis.awake.rawValue:
                    awakeningsCount += 1
                default:
                    break
                }
            }

            totalSleepSeconds = deepSleepSeconds + coreSleepSeconds + remSleepSeconds
        }

        healthStore.execute(query)
        return nil
    }
}
