//
//  BDIAssessmentInfoView.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 17/09/2024.
//

import SwiftUI

struct BDIAssessmentInfoView: View {
    @Binding var assessmentState: BDIAssessmentState
    
    var instructions: BDIAssessmentInstructions
    
    var body: some View {
        VStack {
            HStack {
                Text(instructions.title)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            ScrollView {
                Text(instructions.description)
                    .padding(.horizontal)
            }
        }
        .padding(.horizontal)
        .padding(.top)
        .padding(.bottom, 16)
        .transition(.push(from: .trailing))
    }
}

#Preview {
    @Previewable @State var info = BDIAssessmentState.info
    return BDIAssessmentInfoView(assessmentState: $info, instructions: BDIAssessmentInstructions(title: "", description: "String"))
}
