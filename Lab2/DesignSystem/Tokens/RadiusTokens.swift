//
//  RadiusTokens.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public enum DSRadiusTokens {
    public static let small: CGFloat = 4
    public static let base: CGFloat = 8
    public static let large: CGFloat = 16
    public static let full: CGFloat = 9999
    
    static func radius(fromToken token: String) -> CGFloat {
        switch token {
        case "small": return small
        case "base": return base
        case "large": return large
        case "full": return full
        default: return small
        }
    }
}
