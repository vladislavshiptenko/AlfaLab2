//
//  SpacingTokens.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public enum DSSpacingTokens {
    public static let space100: CGFloat = 4
    public static let space200: CGFloat = 8
    public static let space300: CGFloat = 12
    public static let space400: CGFloat = 16
    public static let space600: CGFloat = 24
    public static let space1600: CGFloat = 64
    
    static func spacing(fromToken token: String) -> CGFloat {
        switch token {
        case "space100": return space100
        case "space200": return space200
        case "space300": return space300
        case "space400": return space400
        case "space600": return space600
        case "space1600": return space1600
        default: return space100
        }
    }
}

