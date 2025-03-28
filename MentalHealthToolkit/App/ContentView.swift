//
//  ContentView.swift
//  MentalHealthToolkit
//
//  Created by Santi on 08/03/2025.
//

import SwiftUI

struct ContentView: View {
    @CTLTheme var theme
    
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if viewModel.status == .loading {
                ProgressView()
                    .tint(theme.colorPrimaryIcStrong)
            } else {
                HomeView(viewModel: HomeViewModel(model: HealthyDay()))
                    .environment(\.healthStoreStatus, viewModel.status)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme.colorNeutralBgWeak)
        .task {
            await viewModel.setup()
        }
        .alert(LocalizableKey.resolvePermissions, isPresented: $viewModel.showSettingsAlert) {
            Button(LocalizableKey.accept, role: .cancel) {}
        } message: {
            Text(LocalizableKey.howToChangeHealthSettings)
        }
    }
}

#Preview {
    ContentView()
}
