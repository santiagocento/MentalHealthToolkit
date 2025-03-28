//
//  RadioButton.swift
//  HealthJournal
//
//  Created by Santi on 12/12/2024.
//

import SwiftUI

struct RadioButton: View {
    @CTLTheme var theme
    var condition: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    .primary,
                    style: StrokeStyle(
                        lineWidth: 1,
                        lineCap: .round
                    )
                )
                .frame(width: 24, height: 24)
            if condition {
                Circle()
                    .fill(theme.colorPrimaryBgDefault)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
