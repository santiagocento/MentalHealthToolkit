//
//  CTLTextModifier.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLTextViewModifier: ViewModifier {
    @CTLTheme var theme
    let type: CTLTextStyleType
    
    func body(content: Content) -> some View {
        switch type {
        case .hint:
            content
                .foregroundColor(theme.colorDangerTextDefault)
                .typography(.body_s_midcontrast)
        case .toggle:
            content
                .scaleEffect(1.1)
                .foregroundColor(theme.colorNeutralTextWeak)
                .typography(.title_s_midcontrast)
        case .menu:
            content
                .foregroundColor(theme.colorPrimaryTextWeak)
                .typography(.caption_highcontrast)
        }
    }
}
