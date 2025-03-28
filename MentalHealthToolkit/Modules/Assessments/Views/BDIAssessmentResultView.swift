//
//  BDIAssessmentResultView.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 17/09/2024.
//

import SwiftUI

struct BDIAssessmentResultView: View {
    @ObservedObject var viewModel: BDIAssessmentViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizableKey.result)
                    .typography(.title_xxl_highcontrast)
                Spacer()
            }
            .padding()
            
            HStack {
                Text("\(LocalizableKey.bdi2points.toString())\(viewModel.finalScore())")
                    .typography(.title_l_lowcontrast)
                Spacer()
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}
