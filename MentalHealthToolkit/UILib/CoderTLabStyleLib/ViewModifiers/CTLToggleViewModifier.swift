//
//  CTLToggleViewModifier.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLToggleViewModifier: ViewModifier {
    @CTLTheme var theme
    let type: CTLToggleStyle
    
    func body(content: Content) -> some View {
        switch type {
        case .main:
            content
                .fixedSize()
                .scaleEffect(0.65)
                .toggleStyle(SwitchToggleStyle(tint: theme.colorPrimaryBgDefault))
        }
    }
}
