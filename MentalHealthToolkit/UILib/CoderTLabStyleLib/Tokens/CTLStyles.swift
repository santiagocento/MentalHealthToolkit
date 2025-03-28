//
//  CTLButtonStyleType.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//


import Foundation
import SwiftUI



public enum CTLTextFieldStyle {
    case main
}

public enum CTLTextStyleType {
    case hint
    case toggle
    case menu
}

public enum CTLObjectStatus {
    case focused
    case unfocused
    case error
    
    public init(nilLiteral:()) {
        self = .unfocused
    }
}

public enum CTLToggleStyle {
    case main
}

public enum BadgeEnphasisType {
    case high
    case medium
}

public enum BadgeEnphasisColor {
    case red
    case orange
    case yellow
    case green
    case lightBlue
    case blue
    case purple
    case pink
    case gray
}

public enum CTLIconBoxColor {
    case blue
    case gray
    case green
}

public enum CTLIconBoxSize {
    case medium
    case large
}
