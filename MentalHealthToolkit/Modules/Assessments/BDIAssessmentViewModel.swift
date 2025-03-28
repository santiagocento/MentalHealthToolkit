//
//  BDIAssessmentViewModel.swift
//  MentalHealthToolkit
//
//  Created by Santi on 27/03/2025.
//

import SwiftUI

class BDIAssessmentViewModel: ObservableObject {
    @Published var assessment: BDIAssessment
    
    init(assessment: BDIAssessment) {
        self.assessment = assessment
    }
    
    func finalScore() -> Int {
        let score = assessment.questions.reduce(0) { partialResult, question in
            partialResult + (question.options.first { $0.selected }?.points ?? 0)
        }
        assessment.healthyDay.mentalHealth.lastDepressionScore = score
        return score
    }
}
