//
//  CTLButtonStyle.swift
//  CoderTLabStyleLib
//
//  Created by Santi on 10/03/2025.
//

import SwiftUI

struct CTLButtonStyle: ButtonStyle {
    @CTLTheme var theme
    let type: CTLButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        switch type {
        case .primaryFilled(let size, let status):
            if status == .loading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, size.verticalPadding)
                    .padding(.horizontal, size.horizontalPadding)
            } else {
                configuration.label
                    .typography(size.typography)
                    .foregroundColor(status == .disabled ? theme.colorNeutralTextWeak : Color.colorGray01)
                    .padding(.vertical, size.verticalPadding)
                    .padding(.horizontal, size.horizontalPadding)
                    .frame(maxWidth: .infinity)
                    .frame(height: size.frameHeight)
                    .background(configuration.isPressed ? status.pressedBgColor : status.bgColor)
                    .clipShape(Capsule())
            }
        case .primaryOutline(let size, let status):
            configuration.label
                .typography(size.typography)
                .foregroundColor(configuration.isPressed ? status.pressedTextColor : status.textColor)
                .padding(.vertical, size.verticalPadding)
                .padding(.horizontal, size.horizontalPadding)
                .frame(maxWidth: .infinity)
                .background(configuration.isPressed ? status.pressedBgColor : Color.clear)
                .cornerRadius(CTLBorderRadius._4xlarge.rawValue)
                .overlay(
                    RoundedRectangle(cornerRadius: CTLBorderRadius._4xlarge.rawValue)
                        .inset(by: 0.75)
                        .stroke(theme.colorNeutralBorderWeak, lineWidth: 1.5)
                )
        case .primaryGhost(let size, let status):
            configuration.label
                .typography(configuration.isPressed ? size.pressedTypography : size.typography)
                .foregroundColor(configuration.isPressed ? status.pressedTextColor : status.textColor)
                .padding(.vertical, size.verticalPadding)
                .cornerRadius(CTLBorderRadius._4xlarge.rawValue)
        case .outlineInverted(let color):
            configuration.label
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .foregroundColor(color ?? theme.colorNeutralTextWeaker)
                .overlay(
                    Capsule()
                        .stroke(Color.colorGray01.opacity(0.4), lineWidth: 1.5)
                )
            
        case .chip(let selected):
            configuration.label
                .typography(.body_s_midcontrast_condensed)
                .padding(.vertical, CTLSpacing._xsmall.rawValue)
                .padding(.horizontal, CTLSpacing._small.rawValue)
                .foregroundColor(selected ? theme.colorPrimaryTextStrong : theme.colorNeutralTextDefault)
                .background(selected ? theme.colorPrimaryBgWeak : theme.colorNeutralBgWeaker)
                .clipShape(Capsule())
        case .iconPrimary(let disabled), .iconPrimaryOutline(let disabled):
            let pressed = configuration.isPressed
            configuration.label
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(pressed && !disabled ? theme.colorPrimaryBgWeak : .clear)
                .overlay(
                    Circle()
                        .stroke(selectBorderColor(pressed: pressed, active: !disabled), lineWidth: 1.5)
                )
                .clipShape(Circle())
        }
    }
    
    private func selectBorderColor(pressed: Bool, active: Bool) -> Color {
        if !active {
            return theme.colorNeutralBorderDefault
        } else if pressed {
            return theme.colorPrimaryBorderStronger
        }
        return theme.colorNeutralBorderDefault
    }
}
