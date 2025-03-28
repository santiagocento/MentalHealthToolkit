//
//  HealthStoreStatus.swift
//  MentalHealthToolkit
//
//  Created by Santi on 28/03/2025.
//

import SwiftUI

enum HealthStoreStatus {
    case loading, permissionDenied, hasDataAccess
}

struct HealthStoreStatusEnvironmentKey: EnvironmentKey {
    static var defaultValue: HealthStoreStatus = .loading
    typealias Value = HealthStoreStatus
}

extension EnvironmentValues {
    var healthStoreStatus: HealthStoreStatus {
        get {
            self[HealthStoreStatusEnvironmentKey.self]
        }
        set {
            self[HealthStoreStatusEnvironmentKey.self] = newValue
        }
    }
}
