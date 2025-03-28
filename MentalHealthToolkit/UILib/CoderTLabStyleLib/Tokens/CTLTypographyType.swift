//
//  CTLTypographyType.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import Foundation
import SwiftUI

public enum CTLTypographyType: String, CaseIterable {
    case title_xxl_highcontrast
    case title_xxl_midupcontrast
    case title_xxl_lowcontrast
    case title_xl_highcontrast
    case title_xl_midupcontrast
    case title_xl_lowcontrast
    case title_l_highcontrast
    case title_l_midupcontrast
    case title_l_lowcontrast
    case title_m_highcontrast
    case title_m_midupcontrast
    case title_m_lowcontrast
    case title_s_highcontrast
    case title_s_midupcontrast
    case title_s_midcontrast
    case title_xs_highcontrast
    case title_xs_midupcontrast
    case title_xs_midcontrast
    case body_m_highcontrast
    case body_m_highcontrast_condensed
    case body_m_midupcontrast
    case body_m_midupcontrast_condensed
    case body_m_midupcontrast_underline
    case body_m_midcontrast
    case body_m_midcontrast_condensed
    case body_m_midcontrast_underline
    case body_s_highcontrast
    case body_s_highcontrast_condensed
    case body_s_midupcontrast
    case body_s_midupcontrast_condensed
    case body_s_midupcontrast_underline
    case body_s_midcontrast
    case body_s_midcontrast_condensed
    case body_s_midcontrast_underline
    case caption_highcontrast
    case caption_midupcontrast
    case caption_midcontrast
    case overline
    case overline_highcontrast
    case overline_midupcontrast
    case overline_uppercase
}

extension CTLTypographyType {
    public var size: CGFloat {
        switch self {
        case .title_xxl_highcontrast, .title_xxl_midupcontrast, .title_xxl_lowcontrast:
            return CTLFontSize._5xlarge
        case .title_xl_highcontrast, .title_xl_midupcontrast, .title_xl_lowcontrast:
            return CTLFontSize._4xlarge
        case .title_l_highcontrast, .title_l_midupcontrast, .title_l_lowcontrast:
            return CTLFontSize._3xlarge
        case .title_m_highcontrast, .title_m_midupcontrast, .title_m_lowcontrast:
            return CTLFontSize._2xlarge
        case .title_s_highcontrast, .title_s_midupcontrast, .title_s_midcontrast:
            return CTLFontSize._xlarge
        case .title_xs_highcontrast, .title_xs_midupcontrast, .title_xs_midcontrast:
            return CTLFontSize._large
            
        case .body_m_highcontrast, .body_m_highcontrast_condensed, .body_m_midupcontrast, .body_m_midupcontrast_condensed,
                .body_m_midcontrast, .body_m_midcontrast_condensed, .body_m_midupcontrast_underline, .body_m_midcontrast_underline:
            return CTLFontSize._large
        case .body_s_highcontrast, .body_s_highcontrast_condensed, .body_s_midupcontrast, .body_s_midupcontrast_condensed,
                .body_s_midupcontrast_underline, .body_s_midcontrast, .body_s_midcontrast_condensed, .body_s_midcontrast_underline:
            return CTLFontSize._medium
            
        case .caption_highcontrast, .caption_midupcontrast, .caption_midcontrast:
            return CTLFontSize._small
    
        case .overline, .overline_highcontrast, .overline_midupcontrast, .overline_uppercase:
            return CTLFontSize._small
        }
    }
    
    public var weight: Font.Weight {
        let contrast = String(describing: self).components(separatedBy: "_").last
        switch contrast {
        case "highcontrast": return CTLFontWeight._highcontrast
        case "midcontrast", "underline": return CTLFontWeight._midcontrast
        case "midupcontrast", "overline": return CTLFontWeight._midupcontrast
        case "lowcontrast": return CTLFontWeight._lowcontrast
        default: return CTLFontWeight._midcontrast
        }
    }
    
    public var underline: Bool {
        let underline = String(describing: self).components(separatedBy: "_").last
        return underline == "underline"
    }
    
    public var uppercase: Bool {
        let underline = String(describing: self).components(separatedBy: "_").last
        return underline == "uppercase"
    }
    
    public var lineHeight: CGFloat {
        switch self {
        case .title_xxl_highcontrast, .title_xxl_midupcontrast, .title_xxl_lowcontrast,
                .title_xl_highcontrast, .title_xl_midupcontrast, .title_xl_lowcontrast:
            return CTLFontLine._2xlarge
        case .title_l_highcontrast, .title_l_midupcontrast, .title_l_lowcontrast:
            return CTLFontLine._xlarge
        case .title_m_highcontrast, .title_m_midupcontrast, .title_m_lowcontrast:
            return CTLFontLine._large
        case .title_s_highcontrast, .title_s_midupcontrast, .title_s_midcontrast:
            return CTLFontLine._medium
        case .title_xs_highcontrast, .title_xs_midupcontrast, .title_xs_midcontrast:
            return CTLFontLine._medium
        case .body_m_highcontrast, .body_m_midupcontrast, .body_m_midupcontrast_underline, .body_m_midcontrast, .body_m_midcontrast_underline:
            return CTLFontLine._medium
        case .body_m_highcontrast_condensed, .body_m_midupcontrast_condensed, .body_m_midcontrast_condensed:
            return CTLFontLine._small
        case .body_s_highcontrast, .body_s_midupcontrast, .body_s_midupcontrast_underline, .body_s_midcontrast, .body_s_midcontrast_underline:
            return CTLFontLine._medium
        case .body_s_highcontrast_condensed, .body_s_midupcontrast_condensed, .body_s_midcontrast_condensed:
            return CTLFontLine._small
        case .caption_highcontrast, .caption_midupcontrast, .caption_midcontrast:
            return CTLFontLine._xsmall
        case .overline, .overline_highcontrast, .overline_midupcontrast, .overline_uppercase:
            return CTLFontLine._2xsmall
        }
    }
}

public struct CTLFontSize {
    public static let _xsmall: CGFloat = 10.0
    public static let _small: CGFloat = 12.0
    public static let _medium: CGFloat = 14.0
    public static let _large: CGFloat = 16.0
    public static let _xlarge: CGFloat = 18.0
    public static let _2xlarge: CGFloat = 20.0
    public static let _3xlarge: CGFloat = 24.0
    public static let _4xlarge: CGFloat = 28.0
    public static let _5xlarge: CGFloat = 32.0
    public static let _6xlarge: CGFloat = 36.0
    public static let _7xlarge: CGFloat = 40.0
    public static let _8xlarge: CGFloat = 48.0
    public static let _9xlarge: CGFloat = 56.0
}

public struct CTLFontWeight {
    public static let _highcontrast: Font.Weight = .semibold
    public static let _midupcontrast: Font.Weight = .medium
    public static let _midcontrast: Font.Weight = .regular
    public static let _lowcontrast: Font.Weight = .light
}

public struct CTLFontLine {
    public static let _2xsmall: CGFloat = 12
    public static let _xsmall: CGFloat = 16
    public static let _small: CGFloat = 20
    public static let _medium: CGFloat = 24
    public static let _large: CGFloat = 28
    public static let _xlarge: CGFloat = 32
    public static let _2xlarge: CGFloat = 40
    public static let _3xlarge: CGFloat = 48
    public static let _4xlarge: CGFloat = 56
}
