//
//  CTLColors.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

public extension Color {
    private init(hex: String) {
        let red, green, blue: CGFloat
        let startIndex = hex.index(hex.startIndex, offsetBy: hex.hasPrefix("#") ? 1 : 0)
        let hexColor = String(hex[startIndex...])
        
        guard hexColor.count == 6 else {
            self.init(.black)
            return
        }
        
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            self.init(.black)
            return
        }
        
        red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        blue = CGFloat(hexNumber & 0x0000ff) / 255
        
        self.init(red: red, green: green, blue: blue, opacity: 1)
    }
    
    func opacity(_ alpha: CTLOpacity) -> Color {
        return self.opacity(alpha.rawValue)
    }
    
    
    // MARK: - Red
    static let colorRed01 = Color(hex: "#FEE8E8")
    static let colorRed02 = Color(hex: "#FFCBCB")
    static let colorRed03 = Color(hex: "#FF9B9B")
    static let colorRed04 = Color(hex: "#EF4E4E")
    static let colorRed05 = Color(hex: "#E12D39")
    static let colorRed06 = Color(hex: "#AB091E")
    static let colorRed07 = Color(hex: "#610316")
    
    // MARK: - Oragne
    static let colorOrange01 = Color(hex: "#FFE8D9")
    static let colorOrange02 = Color(hex: "#FFC3A0")
    static let colorOrange03 = Color(hex: "#FF9D73")
    static let colorOrange04 = Color(hex: "#FF7847")
    static let colorOrange05 = Color(hex: "#F35627")
    static let colorOrange06 = Color(hex: "#C52707")
    static let colorOrange07 = Color(hex: "#841003")
    
    // MARK: - Yellow
    static let colorYellow01 = Color(hex: "#FFFBEA")
    static let colorYellow02 = Color(hex: "#FFF3C4")
    static let colorYellow03 = Color(hex: "#FCE588")
    static let colorYellow04 = Color(hex: "#FADB5F")
    static let colorYellow05 = Color(hex: "#F0B429")
    static let colorYellow06 = Color(hex: "#CB6E17")
    static let colorYellow07 = Color(hex: "#8D2B0B")
    
    // MARK: - Green
    static let colorGreen01 = Color(hex: "#E2E8D6")
    static let colorGreen02 = Color(hex: "#BDCBA0")
    static let colorGreen03 = Color(hex: "#A1B578")
    static let colorGreen04 = Color(hex: "#809060")
    static let colorGreen05 = Color(hex: "#606C48")
    static let colorGreen06 = Color(hex: "#404830")
    static let colorGreen07 = Color(hex: "#202418")
    
    // MARK: - LightBlue
    static let colorLightBlue01 = Color(hex: "#E3F8FF")
    static let colorLightBlue02 = Color(hex: "#B3ECFF")
    static let colorLightBlue03 = Color(hex: "#81DEFD")
    static let colorLightBlue04 = Color(hex: "#40C3F7")
    static let colorLightBlue05 = Color(hex: "#2BB0ED")
    static let colorLightBlue06 = Color(hex: "#127FBF")
    static let colorLightBlue07 = Color(hex: "#035388")
    
    // MARK: - Blue
    static let colorBlue01 = Color(hex: "#E8F3FE")
    static let colorBlue02 = Color(hex: "#CBE1FF")
    static let colorBlue03 = Color(hex: "#5CA6F1")
    static let colorBlue04 = Color(hex: "#2186EB")
    static let colorBlue05 = Color(hex: "#0967D2")
    static let colorBlue06 = Color(hex: "#03449E")
    static let colorBlue07 = Color(hex: "#002159")
    
    // MARK: - Purple
    static let colorPurple01 = Color(hex: "#CABFC4")
    static let colorPurple02 = Color(hex: "#B0A0A6")
    static let colorPurple03 = Color(hex: "#968089")
    static let colorPurple04 = Color(hex: "#7C616C")
    static let colorPurple05 = Color(hex: "#634D56")
    static let colorPurple06 = Color(hex: "#4A3A40")
    static let colorPurple07 = Color(hex: "#31262B")
    
    // MARK: - Pink
    static let colorPink01 = Color(hex: "#FFE3EC")
    static let colorPink02 = Color(hex: "#FFB8D2")
    static let colorPink03 = Color(hex: "#FF8CBA")
    static let colorPink04 = Color(hex: "#E8368F")
    static let colorPink05 = Color(hex: "#DA127D")
    static let colorPink06 = Color(hex: "#A30664")
    static let colorPink07 = Color(hex: "#620042")
    
    // MARK: - Gray
    static let colorGray01 = Color(hex: "#FFFFFF")
    static let colorGray02 = Color(hex: "#F0F4F8")
    static let colorGray03 = Color(hex: "#D9E2EC")
    static let colorGray04 = Color(hex: "#AFBFCF")
    static let colorGray05 = Color(hex: "#6D89A4")
    static let colorGray06 = Color(hex: "#375470")
    static let colorGray07 = Color(hex: "#193754")
    static let colorGray08 = Color(hex: "#0F1820")
}
