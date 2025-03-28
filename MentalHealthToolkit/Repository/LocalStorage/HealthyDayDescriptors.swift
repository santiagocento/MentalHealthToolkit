//
//  HealthyDayDescriptors.swift
//  HealthJournal
//
//  Created by Santiago Cento on 12/07/2024.
//

import Foundation
import SwiftData

struct HealthyDayDescriptors {
    static var thisWeekDaysDescriptor: FetchDescriptor<HealthyDay> {
        var descriptor = FetchDescriptor<HealthyDay>(sortBy: [SortDescriptor(\.date)])
        descriptor.fetchLimit = 7
        return descriptor
    }
}
