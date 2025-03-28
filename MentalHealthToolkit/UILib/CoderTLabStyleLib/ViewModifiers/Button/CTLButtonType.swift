//
//  CTLButtonType.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

public enum CTLButtonType {
    case primaryFilled(size: CTLButtonStyleSize = .large, status: CTLPrimaryFilledButtonStatus = .normal)
    case primaryOutline(size: CTLButtonStyleSize = .large, status: CTLPrimaryOutlineButtonStatus = .normal)
    case primaryGhost(size: CTLButtonStyleSize = .small, status: CTLPrimaryGhostButtonStatus = .normal)
    case outlineInverted(color: Color? = nil)
    case chip(selected: Bool)
    case iconPrimary(active: Bool = true)
    case iconPrimaryOutline(disabled: Bool = true)
}

@MainActor
public enum CTLPrimaryFilledButtonStatus {
    case normal, destructive, disabled, loading
    
    var bgColor: Color? {
        @CTLTheme var theme
        switch self {
        case .normal:
            return theme.colorPrimaryBgDefault
        case .destructive:
            return theme.colorDangerBgDefault
        case .disabled:
            return theme.colorNeutralBgDefault
        default:
            return nil
        }
    }
    
    var pressedBgColor: Color? {
        @CTLTheme var theme
        switch self {
        case .normal:
            return theme.colorPrimaryBgStronger
        case .destructive:
            return theme.colorDangerBgStrong
        default:
            return nil
        }
    }
}

@MainActor
public enum CTLPrimaryGhostButtonStatus {
    case normal, invalid, disabled, loading
    
    var textColor: Color {
        @CTLTheme var theme
        switch self {
        case .normal, .loading:
            return theme.colorPrimaryTextDefault
        case .invalid:
            return theme.colorDangerTextDefault
        case .disabled:
            return theme.colorNeutralTextWeak
        }
    }
    
    var pressedTextColor: Color {
        @CTLTheme var theme
        switch self {
        case .normal, .loading:
            return theme.colorPrimaryTextStronger
        case .invalid:
            return theme.colorDangerTextDefault
        case .disabled:
            return theme.colorNeutralTextWeak
        }
    }
}

@MainActor
public enum CTLPrimaryOutlineButtonStatus {
    case normal, invalid, disabled, loading
    
    var textColor: Color {
        @CTLTheme var theme
        switch self {
        case .normal, .loading:
            return theme.colorPrimaryTextDefault
        case .invalid:
            return theme.colorDangerTextDefault
        case .disabled:
            return theme.colorNeutralTextWeak
        }
    }
    
    var pressedBgColor: Color {
        @CTLTheme var theme
        switch self {
        case .normal:
            return theme.colorPrimaryBgWeak
        case .invalid:
            return theme.colorDangerBgWeak
        default:
            return .clear
        }
    }
    
    var pressedTextColor: Color {
        @CTLTheme var theme
        switch self {
        case .normal:
            return theme.colorPrimaryTextStronger
        default:
            return textColor
        }
    }
}

@MainActor
public enum CTLButtonStyleSize {
    case small, medium, large
    
    var verticalPadding: CGFloat {
        switch self {
        case .small:
            return CTLSpacing._2xsmall.rawValue
        case .medium:
            return CTLSpacing._xsmall.rawValue
        case .large:
            return CTLSpacing._small.rawValue
        }
    }
        
    var horizontalPadding: CGFloat {
        switch self {
        case .small:
            return CTLSpacing._medium.rawValue
        case .medium:
            return CTLSpacing._medium.rawValue
        case .large:
            return CTLSpacing._xlarge.rawValue
        }
    }
    
    var typography: CTLTypographyType {
        switch self {
        case .small:
            return CTLTypographyType.body_s_midupcontrast
        case .medium:
            return CTLTypographyType.body_m_midupcontrast
        case .large:
            return CTLTypographyType.body_m_midupcontrast
        }
    }
    
    var pressedTypography: CTLTypographyType {
        switch self {
        case .small:
            return CTLTypographyType.body_s_midupcontrast_underline
        case .medium:
            return CTLTypographyType.body_m_midupcontrast_underline
        case .large:
            return CTLTypographyType.body_m_midupcontrast_underline
        }
    }
    
    var frameHeight: CGFloat {
        return verticalPadding * 2 + typography.lineHeight
    }
}
