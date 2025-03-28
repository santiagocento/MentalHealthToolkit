//
//  CTLBaseTypography.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLTypographyViewModifier: ViewModifier {
    let type: CTLTypographyType
    
    func body(content: Content) -> some View {
        if type.underline {
            content
                .underline()
                .font(Font.custom("ChivoMono-Regular", size: type.size).weight(type.weight))
        } else {
            content
                .font(Font.custom("ChivoMono-Regular", size: type.size).weight(type.weight))
        }
    }
}
