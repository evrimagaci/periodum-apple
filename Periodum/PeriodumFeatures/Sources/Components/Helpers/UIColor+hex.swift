//  UIColor+hex.swift
//  Created by Umur Gedik on 21.01.2022.

import UIKit

public extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(((hex & 0xff0000) >> 16)) / 255.0,
            green: CGFloat(((hex & 0x00ff00) >> 8)) / 255.0,
            blue: CGFloat(((hex & 0x0000ff) >> 0)) / 255.0,
            alpha: alpha
        )
    }
}

