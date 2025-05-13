//
//  ColorTokens.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public enum DSColorTokens {
    public static let baseDefault = UIColorFromRGB(0xFFFFFF)
    public static let disabledDefault = UIColorFromRGB(0xD9D9D9)
    public static let brandDefault = UIColorFromRGB(0x2C2C2C)
    public static let neutralDefault = UIColorFromRGB(0x5A5A5A)
    public static let successDefault = UIColorFromRGB(0x14AE5C)
    public static let warningDefault = UIColorFromRGB(0xE8B931)
    public static let errorDefault = UIColorFromRGB(0xEC221F)
    
    public static let baseSecondary = UIColorFromRGB(0xF5F5F5)
    public static let brandSecondary = UIColorFromRGB(0xE6E6E6)
    public static let neutralSecondary = UIColorFromRGB(0xCDCDCD)
    public static let successSecondary = UIColorFromRGB(0xCFF7D3)
    public static let warningSecondary = UIColorFromRGB(0xFFF1C2)
    public static let errorSecondary = UIColorFromRGB(0xFDD3D0)
}

func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
    return UIColor(
        red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
        green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
        blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
        alpha: 1.0)
}
