//
//  Color+UIColor.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation
import SwiftUI

extension Color {
    var uiColor: UIColor? {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        } else {
            let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
            var hexNumber: UInt64 = 0
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
            let result = scanner.scanHexInt64(&hexNumber)
            if result {
                r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
                a = CGFloat(hexNumber & 0x0000_00FF) / 255
                return UIColor(red: r, green: g, blue: b, alpha: a)
            } else {
                return nil
            }
        }
    }
}
