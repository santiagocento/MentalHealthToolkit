//
//  ScreenTimeLastMonthChartView.swift
//  MentalHealthToolkit
//
//  Created by Santi on 29/03/2025.
//

import SwiftUI
import ScreenTime
import DeviceActivity

struct ScreenTimeLastMonthChartView: View {
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "lastMonth")
    @State private var filter = DeviceActivityFilter(
        segment: .daily(during: DateInterval(
            start: Calendar.current.date(byAdding: .month, value: -1, to: .now) ?? .now, end: .now)),
        users: .all,
        devices: .init([.iPhone]))
    
    
    var body: some View {
        DeviceActivityReport(context, filter: filter)
    }
}

#Preview {
    ScreenTimeLastMonthChartView()
}
