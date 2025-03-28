//
//  File.swift
//
//
//  Created by Javier Alejandro Huajardo on 16/08/2024.
//

import Foundation
import SwiftUI

public enum CTLStroke: String, CaseIterable {
    case focus_stroke_default
    case focus_stroke_error
}

extension CTLStroke {
    public var color: Color {
        switch self {
        case .focus_stroke_default: return Color.colorPurple01
        case .focus_stroke_error: return Color.colorRed01
        }
    }
    
    public var radius: CGFloat {
        switch self {
        case .focus_stroke_default: return CTLBorderRadius._xsmall.rawValue
        case .focus_stroke_error: return CTLBorderRadius._xsmall.rawValue
        }
    }
    
    public var border: CGFloat {
        switch self {
        case .focus_stroke_default: return CTLBorderStrokes._large.rawValue
        case .focus_stroke_error: return CTLBorderStrokes._large.rawValue
        }
    }
}
