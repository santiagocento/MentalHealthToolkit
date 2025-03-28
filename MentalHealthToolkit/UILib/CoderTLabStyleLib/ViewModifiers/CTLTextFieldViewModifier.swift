//
//  CTLTextField.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLTextFieldViewModifier: ViewModifier {
    let type: CTLTextFieldStyle
    var status: CTLObjectStatus
    @CTLTheme var theme
    
    private func getStrokeColor() -> Color {
        switch status {
        case .focused:
            return theme.colorPrimaryBorderDefault
        case .unfocused:
            return theme.colorNeutralBorderDefault
        case .error:
            return theme.colorDangerBorderDefault
        }
    }
    private func getLineWidth() -> CGFloat {
        switch status {
        case .focused:
            return 1.5
        case .unfocused:
            return 1
        case .error:
            return 1.5
        }
    }
    private func getInset() -> CGFloat {
        switch status {
        case .focused:
            return 0
        case .unfocused:
            return 0.75
        case .error:
            return 0.75
        }
    }
    
    func body(content: Content) -> some View {
        switch type {
        case .main:
            content
                .typography(.title_s_midcontrast)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.horizontal, CTLSpacing._medium.rawValue)
                .padding(.vertical, CTLSpacing._small.rawValue)
                .frame(maxWidth: .infinity, maxHeight: CTLSpacing._3xlarge.rawValue, alignment: .center)
                .background(theme.colorNeutralBgWeaker)
                .foregroundColor(theme.colorNeutralTextDefault)
                .overlay(
                    RoundedRectangle(cornerRadius: CTLBorderRadius._small.rawValue)
                        .inset(by: 0.75)
                        .stroke(getStrokeColor(), lineWidth: getLineWidth())
                )
        }
    }
}
