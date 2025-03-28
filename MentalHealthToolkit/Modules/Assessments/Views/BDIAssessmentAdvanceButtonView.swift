//
//  BDIAssessmentAdvanceButtonView.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 17/09/2024.
//

import SwiftUI

struct BDIAssessmentAdvanceButtonView: View {
    @Environment(\.dismiss) var dismiss
    @CTLTheme var theme
    @Binding var assessmentState: BDIAssessmentState
    @Binding var questionNumber: Int
    var totalQuestions: Int
    
    var body: some View {
        HStack {
            Spacer()
            switch assessmentState {
            case .info:
                Button(LocalizableKey.start) {
                    withAnimation(.bouncy) {
                        assessmentState = .assessment
                    }
                }
                .customStyle(.primaryFilled(size: .large, status: .normal))
            case .assessment:
                if questionNumber == totalQuestions {
                    Button(LocalizableKey.finish) {
                        withAnimation(.bouncy) {
                            assessmentState = .result
                        }
                    }
                    .customStyle(.primaryFilled(size: .large, status: .normal))
                } else {
                    Image(systemName: "arrow.right")
                        .customStyle(.primaryFilled(size: .large, status: .normal))
                        .contentShape(.rect)
                        .onTapGesture {
                            withAnimation {
                                questionNumber += 1
                            }
                        }
                }
            case .result:
                Button(LocalizableKey.accept) {
                    withAnimation(.bouncy) {
                        dismiss()
                    }
                }
                .customStyle(.primaryFilled(size: .large, status: .normal))
            }
            Spacer()
        }
        .padding(.vertical, 48)
        .contentShape(.rect)
    }
}

#Preview {
    @Previewable @State var assessmentState: BDIAssessmentState = .assessment
    @Previewable @State var questionNumber: Int = 0
    
    BDIAssessmentAdvanceButtonView(assessmentState: $assessmentState, questionNumber: $questionNumber, totalQuestions: 12)
}
