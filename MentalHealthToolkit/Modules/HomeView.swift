//
//  HomeView.swift
//  HealthJournal
//
//  Created by Santiago Cento on 13/07/2024.
//

import SwiftUI
import HealthKit
import HealthKitUI

struct HomeView: View {
    @EnvironmentObject var pathStore: NavigationPathStore
    @Environment(\.healthStoreStatus) var healthStoreStatus
    @CTLTheme var theme
    @StateObject var viewModel: HomeViewModel
    @State var lastMindfulSession: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
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
               
            if healthStoreStatus == .hasDataAccess {
                VStack(alignment: .leading) {
                    Text(LocalizableKey.lastMindfulSession)
                        .typography(.body_m_highcontrast)
                        .foregroundStyle(theme.colorNeutralTextStrong)
                        .padding(.bottom, 4)
                    Text(lastMindfulSession)
                        .foregroundStyle(theme.colorNeutralTextWeak)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .roundedBorder()
                .padding(.top, 12)
                .task {
                    lastMindfulSession = await viewModel.getLastMindfulSession()
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle(Text(LocalizableKey.home))
        .navigationBarTitleDisplayMode(.large)
        .scrollContentBackground(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorNeutralBgWeak)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(model: HealthyDay()))
}
