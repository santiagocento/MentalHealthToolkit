//
//  MentalHealthView.swift
//  HealthJournal
//
//  Created by Santiago Cento on 13/07/2024.
//

import SwiftUI
import HealthKit
import HealthKitUI

struct MentalHealthView: View {
    @EnvironmentObject var pathStore: PathStore
    @CTLTheme var theme
    @StateObject var viewModel: MentalHealthViewModel
    @State var lastMindfulSession: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.status == .loading {
                ProgressView()
                    .tint(theme.colorPrimaryIcStrong)
            } else {
                VStack(alignment: .leading) {
                    Text(LocalizableKey.lastDepressionAssesment)
                        .typography(.title_s_highcontrast)
                        .foregroundStyle(theme.colorNeutralTextStrong)
                        .padding(.bottom, 4)
                    Text(viewModel.getLastDepressionAssessment())
                        .padding(.bottom)
                        .foregroundStyle(theme.colorNeutralTextWeak)
                    Button(LocalizableKey.takeDepressionTest) {
                        pathStore.path.append(BDIAssessment(healthyDay: viewModel.model))
                    }
                    .customStyle(.primaryFilled(size: .medium))
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 12)
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text(LocalizableKey.lastMindfulSession)
                        .typography(.title_s_highcontrast)
                        .padding(.bottom)
                    Text(lastMindfulSession)
                        .onAppear {
                            Task {
                                lastMindfulSession = await viewModel.getLastMindfulSession()
                            }
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .roundedBorder()
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle(Text(LocalizableKey.home))
        .navigationBarTitleDisplayMode(.large)
        .scrollContentBackground(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorNeutralBgWeak)
        .task {
            await viewModel.setup()
        }
        .alert(LocalizableKey.resolvePermissions, isPresented: $viewModel.showSettingsAlert) {
            Button(LocalizableKey.openSettings) {
                viewModel.openAppSettings()
            }
            .fontWeight(.bold)
            Button(LocalizableKey.cancel, role: .cancel) {}
        } message: {
            Text(LocalizableKey.howToChangeHealthSettings)
        }
    }
}

#Preview {
    MentalHealthView(viewModel: MentalHealthViewModel(model: HealthyDay()))
}
