//
//  CTLTheme.swift
//  stylepaywaylib
//
//  Created by Santiago Gabriel Cento on 19/12/2024.
//

import UIKit

@propertyWrapper
@MainActor public struct CTLTheme {
    
    public init() { }
    
    public var wrappedValue: CTLThemeColors {
        get { UIScreen.main.traitCollection.userInterfaceStyle == .dark ? CTLDarkThemeColors() : CTLLightThemeColors() }
    }
}
