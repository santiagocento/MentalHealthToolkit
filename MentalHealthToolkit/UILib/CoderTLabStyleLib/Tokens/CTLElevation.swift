//
//  CTLElevation.swift
//  StylePayWay
//
//  Created by Santiago Gabriel Cento on 11/02/2025.
//

import SwiftUI

public enum CTLElevation {
    case elevation10(dropShadow: CTLDropShadow)
    case elevation20(dropShadow: CTLDropShadow)
    case elevation20inverted(dropShadow: CTLDropShadow)
    case elevation30(dropShadow: CTLDropShadow)
    case elevation40(dropShadow: CTLDropShadow)
}

public enum CTLDropShadow {
    case dropShadow1
    case dropShadow2
}


public struct CTLElevationModifier: ViewModifier {
    let type: CTLElevation
   
    public func body(content: Content) -> some View {
        switch type {
        case .elevation10(let dropShadow):
            content
                .shadow(color: dropShadow == .dropShadow1 ? .colorBlue07.opacity(0.02) : .colorBlue07.opacity(0.04),
                        radius: dropShadow == .dropShadow1 ? 4 : 16,
                        x: 0, y: dropShadow == .dropShadow1 ? 2 : 8)
        case .elevation20(let dropShadow):
            content
                .shadow(color: dropShadow == .dropShadow1 ? .colorGray07.opacity(0.04) : .colorBlue07.opacity(0.06),
                        radius: dropShadow == .dropShadow1 ? 2 : 4,
                        x: 0, y: dropShadow == .dropShadow1 ? 1 : 2)
        default:
            content
        }
    }
}
