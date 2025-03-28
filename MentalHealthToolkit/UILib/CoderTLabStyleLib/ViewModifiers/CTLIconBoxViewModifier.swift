//
//  CTLIconBoxViewModifier.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLIconBoxViewModifier: ViewModifier {
    @CTLTheme var theme
    let color: CTLIconBoxColor
    let size: CTLIconBoxSize
    
    private func getFgColor() -> Color {
        switch color {
        case .blue:
            theme.colorIconBlue
        case .gray:
            theme.colorIconGray
        case .green:
            theme.colorIconGreen
        }
    }
    
    private func getBgColor() -> Color {
        switch color {
        case .blue:
            theme.colorIconBgBlue
        case .gray:
            theme.colorIconBgGray
        case .green:
            theme.colorIconBgGreen
        }
    }
    
    private func getSize() -> CGFloat {
        switch size {
        case .medium:
            return 16
        case .large:
            return 24
        }
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: getSize(), height: getSize())
            .padding(CTLSpacing._xsmall.rawValue)
            .foregroundColor(getFgColor())
            .background(getBgColor())
            .clipShape(RoundedRectangle(cornerRadius: CTLBorderRadius._small.rawValue))
    }
}
