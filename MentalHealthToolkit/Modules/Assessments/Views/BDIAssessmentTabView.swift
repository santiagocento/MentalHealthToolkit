//
//  BDIAssessmentTabView.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 17/09/2024.
//

import SwiftUI

struct BDIAssessmentTabView: View {
    @Binding var assessmentState: BDIAssessmentState
    @Binding var questionNumber: Int
    @Binding var assessment: BDIAssessment
    
    var body: some View {
        TabView(selection: $questionNumber) {
            ForEach(0..<assessment.questions.count, id: \.self) { index in
                VStack {
                    HStack {
                        Text(assessment.questions[index].question)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding()
                    ForEach(0..<assessment.questions[index].options.count, id: \.self) { optionIndex in
                        VStack {
                            HStack (alignment: .top) {
                                RadioButton(condition: assessment.questions[index].options[optionIndex].selected)
                                Text(assessment.questions[index].options[optionIndex].affirmation)
                                    .padding(.leading, 4)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            Divider()
                        }
                        .onTapGesture {
                            assessment.questions[index].options.enumerated().forEach { i, _ in
                                assessment.questions[index].options[i].selected = i == optionIndex
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .transition(.push(from: .trailing))
    }
}
