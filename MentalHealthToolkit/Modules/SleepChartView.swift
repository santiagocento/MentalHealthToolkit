//
//  SleepChartView.swift
//  MentalHealthToolkit
//
//  Created by Santi on 28/03/2025.
//

import SwiftUI
import Charts

struct SleepChartView: View {
    @CTLTheme var theme
    var data: [SleepData.Series] = SleepData.example
    
    private var totalSeconds: Int { data.reduce(0) { $0 + $1.seconds } }
    private var totalHours: Int { totalSeconds / 3600 }
    private var totalMin: Int { totalSeconds % 3600 / 60 }

    var body: some View {
        VStack {
            HStack {
                Text("Última noche")
                    .typography(.title_s_highcontrast)
                Spacer()
                Text("\(totalHours) hs. \(totalMin) min. de sueño")
                    .foregroundColor(theme.colorNeutralTextWeak)
            }
            chart
        }
        .padding()
    }

    private var chart: some View {
        Chart(data, id: \.category) { element in
            Plot {
                BarMark(x: .value("Data Size", element.seconds))
                    .foregroundStyle(by: .value("Data Category", element.category))
            }
        }
        .chartPlotStyle { plotArea in
            plotArea
                .background(Color(.systemFill))
                .cornerRadius(8)
        }
        .chartForegroundStyleScale([
            "Profundo": Color.colorLightBlue07,
            "Ligero": Color.colorLightBlue06,
            "REM": Color.colorLightBlue04
        ])
        .chartXAxis(.hidden)
        .chartXScale(domain: 0...totalSeconds + 2000)
        .chartYScale(range: .plotDimension(endPadding: -8))
        .chartLegend(position: .bottom, spacing: 8)
        .frame(height: 50)
    }
}

#Preview {
    SleepChartView(data: SleepData.example)
}

struct SleepData {
    struct Series: Identifiable {
        let category: String
        let seconds: Int
        var id: String { category }
    }

    static let example: [Series] = [
        .init(category: "Profundo", seconds: 7600),
        .init(category: "Ligero", seconds: 10800),
        .init(category: "REM", seconds: 3600),
    ]
}
