//
//  CTLThemeColors.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

public protocol CTLThemeColors {
    // MARK: - Primary
    
    // MARK: Text
    var colorPrimaryTextStronger: Color { get }
    var colorPrimaryTextStrong: Color { get }
    var colorPrimaryTextDefault: Color { get }
    var colorPrimaryTextWeak: Color { get }
    
    // MARK: Background
    var colorPrimaryBgStronger: Color { get }
    var colorPrimaryBgStrong: Color { get }
    var colorPrimaryBgDefault: Color { get }
    var colorPrimaryBgWeak: Color { get }
    
    // MARK: Icon
    var colorPrimaryIcStronger: Color { get }
    var colorPrimaryIcStrong: Color { get }
    var colorPrimaryIcDefault: Color { get }
    
    // MARK: Border
    var colorPrimaryBorderStronger: Color { get }
    var colorPrimaryBorderStrong: Color { get }
    var colorPrimaryBorderDefault: Color { get }
    
    // MARK: - Secondary
    
    // MARK: Text
    var colorSecondaryTextStronger: Color { get }
    var colorSecondaryTextStrong: Color { get }
    var colorSecondaryTextDefault: Color { get }
    var colorSecondaryTextWeak: Color { get }
    
    // MARK: Background
    var colorSecondaryBgStronger: Color { get }
    var colorSecondaryBgStrong: Color { get }
    var colorSecondaryBgDefault: Color { get }
    var colorSecondaryBgWeak: Color { get }
    
    // MARK: Icon
    var colorSecondaryIcStronger: Color { get }
    var colorSecondaryIcStrong: Color { get }
    var colorSecondaryIcDefault: Color { get }
    
    // MARK: Border
    var colorSecondaryBorderStronger: Color { get }
    var colorSecondaryBorderStrong: Color { get }
    var colorSecondaryBorderDefault: Color { get }
    
    // MARK: - Neutral
    
    // MARK: Text
    var colorNeutralTextStrong: Color { get }
    var colorNeutralTextDefault: Color { get }
    var colorNeutralTextWeak: Color { get }
    var colorNeutralTextWeaker: Color { get }
    
    // MARK: Background
    var colorNeutralBgStronger: Color { get }
    var colorNeutralBgStrong: Color { get }
    var colorNeutralBgDefault: Color { get }
    var colorNeutralBgWeak: Color { get }
    var colorNeutralBgWeaker: Color { get }
    var colorNeutralBgScrim: Color { get }
    
    // MARK: Icon
    var colorNeutralIcStrong: Color { get }
    var colorNeutralIcDefault: Color { get }
    var colorNeutralIcWeak: Color { get }
    var colorNeutralIcWeaker: Color { get }
    
    // MARK: Border
    var colorNeutralBorderStrong: Color { get }
    var colorNeutralBorderDefault: Color { get }
    var colorNeutralBorderWeak: Color { get }
    
    // MARK: - Success
    
    // MARK: Text
    var colorSuccessTextDefault: Color { get }
    
    // MARK: Background
    var colorSuccessBgDefault: Color { get }
    var colorSuccessBgWeak: Color { get }
    
    // MARK: Icon
    var colorSuccessIcDefault: Color { get }
    
    // MARK: Border
    var colorSuccessBorderDefault: Color { get }
    
    // MARK: - Danger
    
    // MARK: Text
    var colorDangerTextDefault: Color { get }
    
    // MARK: Background
    var colorDangerBgStrong: Color { get }
    var colorDangerBgDefault: Color { get }
    var colorDangerBgWeak: Color { get }
    
    // MARK: Icon
    var colorDangerIcDefault: Color { get }
    
    // MARK: Border
    var colorDangerBorderDefault: Color { get }
    
    // MARK: - Warning
    
    // MARK: Text
    var colorWarningTextDefault: Color { get }
    
    // MARK: Background
    var colorWarningBgDefault: Color { get }
    var colorWarningBgWeak: Color { get }
    
    // MARK: Icon
    var colorWarningIcDefault: Color { get }
    
    // MARK: Border
    var colorWarningBorderDefault: Color { get }
    
    // MARK: - Info
    
    // MARK: Text
    var colorInfoTextDefault: Color { get }
    
    // MARK: Background
    var colorInfoBgDefault: Color { get }
    var colorInfoBgWeak: Color { get }
    
    // MARK: Icon
    var colorInfoIcDefault: Color { get }
    
    // MARK: Border
    var colorInfoBorderDefault: Color { get }
    
    // MARK: - Icons
    var colorIconBlue: Color { get }
    var colorIconBgBlue: Color { get }
    
    var colorIconGray: Color { get }
    var colorIconBgGray: Color { get }
    
    var colorIconGreen: Color { get }
    var colorIconBgGreen: Color { get }
    
    //MARK: - Gradients
    var colorGradient01: LinearGradient { get }
    
    //MARK: - Direct colors tokens
    var blue04: Color { get }
    var gray06: Color { get }
    var green05: Color { get }
}
