//
//  CTLLightThemeColors.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

public struct CTLLightThemeColors: CTLThemeColors {
    
    public init() { }
    
    // MARK: - Primary
    
    // MARK: Text
    public var colorPrimaryTextStronger: Color = .colorGreen07
    public var colorPrimaryTextStrong: Color = .colorGreen05
    public var colorPrimaryTextDefault: Color = .colorGreen04
    public var colorPrimaryTextWeak: Color = .colorGreen03
    
    // MARK: Background
    public var colorPrimaryBgStronger: Color = .colorGreen07
    public var colorPrimaryBgStrong: Color = .colorGreen05
    public var colorPrimaryBgDefault: Color = .colorGreen04
    public var colorPrimaryBgWeak: Color = .colorGreen01
    
    // MARK: Icon
    public var colorPrimaryIcStronger: Color = .colorGreen07
    public var colorPrimaryIcStrong: Color = .colorGreen05
    public var colorPrimaryIcDefault: Color = .colorGreen04
    
    // MARK: Border
    public var colorPrimaryBorderStronger: Color = .colorGreen07
    public var colorPrimaryBorderStrong: Color = .colorGreen05
    public var colorPrimaryBorderDefault: Color = .colorGreen04
    
    // MARK: - Secondary
    
    // MARK: Text
    public var colorSecondaryTextStronger: Color = .colorBlue07
    public var colorSecondaryTextStrong: Color = .colorBlue06
    public var colorSecondaryTextDefault: Color = .colorBlue06
    public var colorSecondaryTextWeak: Color = .colorBlue04
    
    // MARK: Background
    public var colorSecondaryBgStronger: Color = .colorBlue07
    public var colorSecondaryBgStrong: Color = .colorBlue06
    public var colorSecondaryBgDefault: Color = .colorBlue06
    public var colorSecondaryBgWeak: Color = .colorBlue01
    
    // MARK: Icon
    public var colorSecondaryIcStronger: Color = .colorBlue07
    public var colorSecondaryIcStrong: Color = .colorBlue06
    public var colorSecondaryIcDefault: Color = .colorBlue06
    
    // MARK: Border
    public var colorSecondaryBorderStronger: Color = .colorBlue07
    public var colorSecondaryBorderStrong: Color = .colorBlue06
    public var colorSecondaryBorderDefault: Color = .colorBlue06
    
    // MARK: - Neutral
    
    // MARK: Text
    public var colorNeutralTextStrong: Color = .colorGray08
    public var colorNeutralTextDefault: Color = .colorGray06
    public var colorNeutralTextWeak: Color = .colorGray05
    public var colorNeutralTextWeaker: Color = .colorGray01
    
    // MARK: Background
    public var colorNeutralBgStronger: Color = .colorGray08
    public var colorNeutralBgStrong: Color = .colorGray04
    public var colorNeutralBgDefault: Color = .colorGray03
    public var colorNeutralBgWeak: Color = .colorGray02
    public var colorNeutralBgWeaker: Color = .colorGray01
    public var colorNeutralBgScrim: Color = .colorGray07.opacity(.opacity70)
    
    // MARK: Icon
    public var colorNeutralIcStrong: Color = .colorGray08
    public var colorNeutralIcDefault: Color = .colorGray06
    public var colorNeutralIcWeak: Color = .colorGray05
    public var colorNeutralIcWeaker: Color = .colorGray01
    
    // MARK: Border
    public var colorNeutralBorderStrong: Color = .colorGray05
    public var colorNeutralBorderDefault: Color = .colorGray04
    public var colorNeutralBorderWeak: Color = .colorGray03
    
    // MARK: - Success
    
    // MARK: Text
    public var colorSuccessTextDefault: Color = .colorGreen07
    
    // MARK: Background
    public var colorSuccessBgDefault: Color = .colorGreen05
    public var colorSuccessBgWeak: Color = .colorGreen01
    
    // MARK: Icon
    public var colorSuccessIcDefault: Color = .colorGreen05
    
    // MARK: Border
    public var colorSuccessBorderDefault: Color = .colorGreen05
    
    // MARK: - Danger
    
    // MARK: Text
    public var colorDangerTextDefault: Color = .colorRed05
    
    // MARK: Background
    public var colorDangerBgStrong: Color = .colorRed06
    public var colorDangerBgDefault: Color = .colorRed05
    public var colorDangerBgWeak: Color = .colorRed01
    
    // MARK: Icon
    public var colorDangerIcDefault: Color = .colorRed05
    
    // MARK: Border
    public var colorDangerBorderDefault: Color = .colorRed05
    
    // MARK: - Warning
    
    // MARK: Text
    public var colorWarningTextDefault: Color = .colorYellow07
    
    // MARK: Background
    public var colorWarningBgDefault: Color = .colorYellow04
    public var colorWarningBgWeak: Color = .colorYellow01
    
    // MARK: Icon
    public var colorWarningIcDefault: Color = .colorYellow04
    
    // MARK: Border
    public var colorWarningBorderDefault: Color = .colorYellow04
    
    // MARK: - Info
    
    // MARK: Text
    public var colorInfoTextDefault: Color = .colorBlue04
    
    // MARK: Background
    public var colorInfoBgDefault: Color = .colorBlue04
    public var colorInfoBgWeak: Color = .colorBlue01
    
    // MARK: Icon
    public var colorInfoIcDefault: Color = .colorBlue04
    
    // MARK: Border
    public var colorInfoBorderDefault: Color = .colorBlue04
    
    // MARK: - Icons
    
    public var colorIconBlue: Color = .colorBlue05
    public var colorIconBgBlue: Color = .colorBlue01
    
    public var colorIconGray: Color = .colorGray06
    public var colorIconBgGray: Color = .colorGray02
    
    public var colorIconGreen: Color = .colorGreen05
    public var colorIconBgGreen: Color = .colorGreen01
    
    //MARK: - Gradients
    
    public var colorGradient01: LinearGradient = LinearGradient(colors: [.colorBlue06, .colorBlue04], startPoint: .leading, endPoint: .trailing)
    
    //MARK: - Direct colors tokens
    public var blue04: Color = .colorBlue04
    public var gray06: Color = .colorGray06
    public var green05: Color = .colorGreen05
}
