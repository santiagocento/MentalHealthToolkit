//
//  BDIAssessmentUIView.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 16/09/2024.
//

import SwiftUI

struct BDIAssessmentUIView: View {
    @Environment(\.dismiss) var dismiss
    @CTLTheme var theme
    @ObservedObject var viewModel: BDIAssessmentViewModel
    
    @State private var questionNumber = 0
    @State private var assessmentState: BDIAssessmentState = .info
    
    var body: some View {
        VStack {
            switch assessmentState {
            case .info:
                BDIAssessmentInfoView(assessmentState: $assessmentState, instructions: viewModel.assessment.instructions)
                
            case .assessment:
                BDIAssessmentTabView(assessmentState: $assessmentState,
                                     questionNumber: $questionNumber,
                                     assessment: $viewModel.assessment)
            case .result:
                BDIAssessmentResultView(viewModel: viewModel)
            }
            Spacer()
            BDIAssessmentAdvanceButtonView(assessmentState: $assessmentState,
                                           questionNumber: $questionNumber,
                                           totalQuestions: viewModel.assessment.questions.count - 1)
            .padding(.horizontal)
        }
        .background(theme.colorNeutralBgWeak)
        .navigationTitle(LocalizableKey.bdi2Inventroy)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "arrow.left")
                    .typography(.body_s_highcontrast)
                    .onTapGesture {
                        withAnimation {
                            onBackPressed()
                        }
                    }
            }
        }
    }
    
    fileprivate func onBackPressed() {
        if assessmentState == .info || assessmentState == .result {
            dismiss()
        }
        if questionNumber == 0 {
            assessmentState = .info
        } else {
            questionNumber -= 1
        }
    }
}

#Preview {
    NavigationStack {
        BDIAssessmentUIView(viewModel: BDIAssessmentViewModel(assessment: BDIAssessment(healthyDay: HealthyDay())))
    }
}
