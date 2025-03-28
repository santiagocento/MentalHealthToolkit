//
//  File.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

/// --------------------------------------------------
extension View {
    public func typography(_ type: CTLTypographyType) -> some View {
        return self.modifier(CTLTypographyViewModifier(type: type))
    }
    
    public func customStroke(_ type: CTLStroke, background: Color? = nil) -> some View {
        return self.modifier(CTLStrokeViewModifier(type: type, background: background))
    }
    
    public func elevation(_ type: CTLElevation) -> some View {
        return self.modifier(CTLElevationModifier(type: type))
    }
    
    public func roundedBorder(_ color: Color? = nil, radius: CGFloat = 16) -> some View {
        @CTLTheme var theme
        return self
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(color ?? theme.colorNeutralBorderDefault)
            }
    }
}

@MainActor
extension Text {
    public func customStyle(_ type: CTLTextStyleType) -> some View {
        return self.modifier(CTLTextViewModifier(type: type))
    }
    
    public func badgeEmphasis(_ type: BadgeEnphasisType, color: BadgeEnphasisColor) -> some View {
        return self.modifier(CTLBadgeEnphasisViewModifier(type: type, color: color))
    }
}

@MainActor
extension TextField where Label == Text {
    public func customStyle(_ type: CTLTextFieldStyle,
                            _ status: CTLObjectStatus = .unfocused) -> some View {
        return self.modifier(CTLTextFieldViewModifier(type: type, status: status))
    }
}

@MainActor
extension SecureField {
    public func customStyle(_ type: CTLTextFieldStyle,
                            _ status: CTLObjectStatus = .unfocused) -> some View {
        return self.modifier(CTLTextFieldViewModifier(type: type, status: status))
    }
}

@MainActor
extension Button {
    public func customStyle(_ type: CTLButtonType) -> some View {
        return self.buttonStyle(CTLButtonStyle(type: type))
    }
}

@MainActor
extension ShareLink {
    public func customStyle(_ type: CTLButtonType) -> some View {
        return self.buttonStyle(CTLButtonStyle(type: type))
    }
}

@MainActor
extension Toggle {
    public func customStyle(_ type: CTLToggleStyle) -> some View {
        return self.modifier(CTLToggleViewModifier(type: type))
           
    }
}

@MainActor
extension Image {
    public func customIconBoxStyle(_ color: CTLIconBoxColor,
                                   size: CTLIconBoxSize = .medium) -> some View {
        return self.resizable()
            .modifier(CTLIconBoxViewModifier(color: color, size: size))
    }
    
    public func customStyle(_ type: CTLButtonType) -> some View {
        return self.modifier(CTLImageButtonStyle(type: type))
    }
}
