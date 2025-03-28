//
//  CTLBadgeEnphasisViewModifier.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLBadgeEnphasisViewModifier: ViewModifier {
    let type: BadgeEnphasisType
    let color: BadgeEnphasisColor
    
    func body(content: Content) -> some View {
        switch type {
        case .high:
            content
                .typography(.overline_midupcontrast)
                .foregroundColor(color == .yellow ? .colorYellow07 : .colorGray01)
                .padding(CTLSpacing._2xsmall.rawValue)
                .background(getBackgroundColorHigh())
                .clipShape(RoundedRectangle(cornerRadius: 4))
        case .medium:
            content
                .typography(.overline_midupcontrast)
                .foregroundColor(getForegroundColorMedium())
                .padding(CTLSpacing._2xsmall.rawValue)
                .background(getBackgroundColorMedium())
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
    
    func getBackgroundColorHigh() -> Color {
        switch color {
        case .red:
                .colorRed04
        case .orange:
                .colorOrange04
        case .yellow:
                .colorYellow03
        case .green:
                .colorGreen05
        case .lightBlue:
                .colorLightBlue04
        case .blue:
                .colorBlue04
        case .purple:
                .colorPurple04
        case .pink:
                .colorPink04
        case .gray:
                .colorGray04
        }
    }
    
    func getBackgroundColorMedium() -> Color {
        switch color {
        case .red:
                .colorRed01
        case .orange:
                .colorOrange01
        case .yellow:
                .colorYellow01
        case .green:
                .colorGreen01
        case .lightBlue:
                .colorLightBlue01
        case .blue:
                .colorBlue01
        case .purple:
                .colorPurple01
        case .pink:
                .colorPink01
        case .gray:
                .colorGray02
        }
    }
    
    func getForegroundColorMedium() -> Color {
        switch color {
        case .red:
                .colorRed05
        case .orange:
                .colorOrange06
        case .yellow:
                .colorYellow06
        case .green:
                .colorGreen06
        case .lightBlue:
                .colorLightBlue07
        case .blue:
                .colorBlue05
        case .purple:
                .colorPurple06
        case .pink:
                .colorPink06
        case .gray:
                .colorGray06
        }
    }
}
