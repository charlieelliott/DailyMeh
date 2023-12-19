//
//  Color+Hex.swift
//  DailyMeh
//
//  Created by Charlie Elliott on 12/18/23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String?) {
        self.init(Color.fromHexString(hex))
    }
    
    private static func fromHexString(_ hex: String?) -> Color {
        guard let hex = hex else {
            return .gray
        }
        
        var colorHexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (colorHexString.hasPrefix("#")) {
            colorHexString.remove(at: colorHexString.startIndex)
        }

        if ((colorHexString.count) != 6) {
            return .gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: colorHexString).scanHexInt64(&rgbValue)

        let uiColor = UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
        
        return Color(uiColor: uiColor)
    }
}


