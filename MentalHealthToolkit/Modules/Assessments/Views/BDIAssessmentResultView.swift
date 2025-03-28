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
                    .font(.title)
                .fontWeight(.black)
                Spacer()
            }
            .padding()
            
            HStack {
                Text("\(LocalizableKey.bdi2points) \(viewModel.finalScore())")
                    .font(.title)
                .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}
