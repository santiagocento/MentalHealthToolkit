//
//  CTLImageButtonStyle.swift
//  MentalHealthToolkit
//
//  Created by Santi on 27/03/2025.
//

import SwiftUI

struct CTLImageButtonStyle: ViewModifier {
    @CTLTheme var theme
    let type: CTLButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .primaryFilled(let size, let status):
            if status == .loading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, size.verticalPadding)
                    .padding(.horizontal, size.horizontalPadding)
            } else {
                content
                    .typography(size.typography)
                    .foregroundColor(status == .disabled ? theme.colorNeutralTextWeak : Color.colorGray01)
                    .padding(.vertical, size.verticalPadding)
                    .padding(.horizontal, size.horizontalPadding)
                    .frame(maxWidth: .infinity)
                    .frame(height: size.frameHeight)
                    .background(status.bgColor)
                    .clipShape(Capsule())
            }
        case .primaryOutline(let size, let status):
            content
                .typography(size.typography)
                .foregroundColor(status.textColor)
                .padding(.vertical, size.verticalPadding)
                .padding(.horizontal, size.horizontalPadding)
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .cornerRadius(CTLBorderRadius._4xlarge.rawValue)
                .overlay(
                    RoundedRectangle(cornerRadius: CTLBorderRadius._4xlarge.rawValue)
                        .inset(by: 0.75)
                        .stroke(theme.colorNeutralBorderWeak, lineWidth: 1.5)
                )
        case .primaryGhost(let size, let status):
            content
                .typography(size.typography)
                .foregroundColor(status.textColor)
                .padding(.vertical, size.verticalPadding)
                .cornerRadius(CTLBorderRadius._4xlarge.rawValue)
        case .outlineInverted(let color):
            content
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .foregroundColor(color ?? theme.colorNeutralTextWeaker)
                .overlay(
                    Capsule()
                        .stroke(Color.colorGray01.opacity(0.4), lineWidth: 1.5)
                )
            
        case .chip(let selected):
            content
                .typography(.body_s_midcontrast_condensed)
                .padding(.vertical, CTLSpacing._xsmall.rawValue)
                .padding(.horizontal, CTLSpacing._small.rawValue)
                .foregroundColor(selected ? theme.colorPrimaryTextStrong : theme.colorNeutralTextDefault)
                .background(selected ? theme.colorPrimaryBgWeak : theme.colorNeutralBgWeaker)
                .clipShape(Capsule())
        case .iconPrimary(let disabled), .iconPrimaryOutline(let disabled):
            content
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(!disabled ? theme.colorPrimaryBgWeak : .clear)
                .overlay(
                    Circle()
                        .stroke(selectBorderColor(active: !disabled), lineWidth: 1.5)
                )
                .clipShape(Circle())
        }
    }
    
    private func selectBorderColor(active: Bool) -> Color {
        if !active {
            return theme.colorNeutralBorderDefault
        } 
        return theme.colorNeutralBorderDefault
    }
}
