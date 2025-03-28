//
//  CTLBaseStroke.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLStrokeViewModifier: ViewModifier {
    let type: CTLStroke
    let background: Color?
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: type.radius, style: .continuous).fill(background ?? .clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: type.radius)
                    .stroke(type.color, lineWidth: type.border)
            )
    }
}
