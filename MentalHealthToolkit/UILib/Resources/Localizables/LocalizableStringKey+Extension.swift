//
//  LocalizableStringKey+Extension.swift
//  MentalHealthToolkit
//
//  Created by Santi on 26/03/2025.
//

import SwiftUI

extension LocalizedStringKey {
    // Convierte LocalizedStringKey a String usando reflexión
    func toString() -> String {
        let mirror = Mirror(reflecting: self)
        guard let key = mirror.children.first(where: { $0.label == "key" })?.value as? String else {
            return "\(self)" // Fallback en caso de no encontrar el key
        }
        
        // Obtiene la cadena localizada usando NSLocalizedString
        return NSLocalizedString(key, comment: "")
    }
}
