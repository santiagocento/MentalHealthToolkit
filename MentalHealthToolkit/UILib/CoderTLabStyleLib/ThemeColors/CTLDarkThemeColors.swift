//
//  CTLDarkThemeColor.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

public struct CTLDarkThemeColors: CTLThemeColors {
    
    public init() { }
    
    // MARK: - Primary
    
    // MARK: Text
    public var colorPrimaryTextStronger: Color = .colorGreen02
    public var colorPrimaryTextStrong: Color = .colorGreen03
    public var colorPrimaryTextDefault: Color = .colorGreen04
    public var colorPrimaryTextWeak: Color = .colorGreen06
    
    // MARK: Background
    public var colorPrimaryBgStronger: Color = .colorGreen02
    public var colorPrimaryBgStrong: Color = .colorGreen03
    public var colorPrimaryBgDefault: Color = .colorGreen04
    public var colorPrimaryBgWeak: Color = .colorGreen06
    
    // MARK: Icon
    public var colorPrimaryIcStronger: Color = .colorGreen02
    public var colorPrimaryIcStrong: Color = .colorGreen03
    public var colorPrimaryIcDefault: Color = .colorGreen04
    
    // MARK: Border
    public var colorPrimaryBorderStronger: Color = .colorGreen02
    public var colorPrimaryBorderStrong: Color = .colorGreen03
    public var colorPrimaryBorderDefault: Color = .colorGreen04
    
    // MARK: - Secondary
    
    // MARK: Text
    public var colorSecondaryTextStronger: Color = .colorBlue01
    public var colorSecondaryTextStrong: Color = .colorBlue03
    public var colorSecondaryTextDefault: Color = .colorBlue04
    public var colorSecondaryTextWeak: Color = .colorBlue04
    
    // MARK: Background
    public var colorSecondaryBgStronger: Color = .colorBlue03
    public var colorSecondaryBgStrong: Color = .colorBlue03
    public var colorSecondaryBgDefault: Color = .colorBlue04
    public var colorSecondaryBgWeak: Color = .colorBlue07
    
    // MARK: Icon
    public var colorSecondaryIcStronger: Color = .colorBlue01
    public var colorSecondaryIcStrong: Color = .colorBlue03
    public var colorSecondaryIcDefault: Color = .colorBlue04
    
    // MARK: Border
    public var colorSecondaryBorderStronger: Color = .colorBlue02
    public var colorSecondaryBorderStrong: Color = .colorBlue03
    public var colorSecondaryBorderDefault: Color = .colorBlue04
    
    // MARK: - Neutral
    
    // MARK: Text
    public var colorNeutralTextStrong: Color = .colorGray01
    public var colorNeutralTextDefault: Color = .colorGray03
    public var colorNeutralTextWeak: Color = .colorGray05
    public var colorNeutralTextWeaker: Color = .colorGray08
    
    // MARK: Background
    public var colorNeutralBgStronger: Color = .colorGray04
    public var colorNeutralBgStrong: Color = .colorGray05
    public var colorNeutralBgDefault: Color = .colorGray06
    public var colorNeutralBgWeak: Color = .colorGray08
    public var colorNeutralBgWeaker: Color = .colorGray07
    public var colorNeutralBgScrim: Color = .colorGray08.opacity(.opacity70)
    
    // MARK: Icon
    public var colorNeutralIcStrong: Color = .colorGray01
    public var colorNeutralIcDefault: Color = .colorGray03
    public var colorNeutralIcWeak: Color = .colorGray05
    public var colorNeutralIcWeaker: Color = .colorGray08
    
    // MARK: Border
    public var colorNeutralBorderStrong: Color = .colorGray03
    public var colorNeutralBorderDefault: Color = .colorGray04
    public var colorNeutralBorderWeak: Color = .colorGray06
    
    // MARK: - Success
    
    // MARK: Text
    public var colorSuccessTextDefault: Color = .colorGreen02
    
    // MARK: Background
    public var colorSuccessBgDefault: Color = .colorGreen03
    public var colorSuccessBgWeak: Color = .colorGreen06
    
    // MARK: Icon
    public var colorSuccessIcDefault: Color = .colorGreen03
    
    // MARK: Border
    public var colorSuccessBorderDefault: Color = .colorGreen03
    
    // MARK: - Danger
    
    // MARK: Text
    public var colorDangerTextDefault: Color = .colorRed03
    
    // MARK: Background
    public var colorDangerBgStrong: Color = .colorRed03
    public var colorDangerBgDefault: Color = .colorRed04
    public var colorDangerBgWeak: Color = .colorRed07
    
    // MARK: Icon
    public var colorDangerIcDefault: Color = .colorRed03
    
    // MARK: Border
    public var colorDangerBorderDefault: Color = .colorRed03
    
    // MARK: - Warning
    
    // MARK: Text
    public var colorWarningTextDefault: Color = .colorYellow03
    
    // MARK: Background
    public var colorWarningBgDefault: Color = .colorYellow03
    public var colorWarningBgWeak: Color = .colorYellow06
    
    // MARK: Icon
    public var colorWarningIcDefault: Color = .colorYellow03
    
    // MARK: Border
    public var colorWarningBorderDefault: Color = .colorYellow03
    
    // MARK: - Info
    
    // MARK: Text
    public var colorInfoTextDefault: Color = .colorBlue03
    
    // MARK: Background
    public var colorInfoBgDefault: Color = .colorBlue03
    public var colorInfoBgWeak: Color = .colorBlue06
    
    // MARK: Icon
    public var colorInfoIcDefault: Color = .colorBlue03
    
    // MARK: Border
    public var colorInfoBorderDefault: Color = .colorBlue03
    
    // MARK: - Icons
    
    public var colorIconBlue: Color = .colorBlue01
    public var colorIconBgBlue: Color = .colorBlue05
    
    public var colorIconGray: Color = .colorGray03
    public var colorIconBgGray: Color = .colorGray06
    
    public var colorIconGreen: Color = .colorGreen02
    public var colorIconBgGreen: Color = .colorGreen06
    
    //MARK: - Gradients
    public var colorGradient01: LinearGradient = LinearGradient(colors: [.colorBlue06, .colorBlue04], startPoint: .leading, endPoint: .trailing)
    
    //MARK: - Direct colors tokens
    public var blue04: Color = .colorBlue04
    public var gray06: Color = .colorGray06
    public var green05: Color = .colorGreen05
}
