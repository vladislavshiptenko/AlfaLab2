//
//  TypographyTokens.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public enum DSTypographyTokens {
    public static let titleHero = UIFont.systemFont(ofSize: 72, weight: .bold)
    public static let titlePage = UIFont.systemFont(ofSize: 48, weight: .bold)
    public static let subtitle = UIFont.systemFont(ofSize: 32, weight: .regular)
    public static let heading = UIFont.systemFont(ofSize: 24, weight: .semibold)
    public static let subheading = UIFont.systemFont(ofSize: 20, weight: .regular)
    public static let bodyBase = UIFont.systemFont(ofSize: 16, weight: .regular)
    public static let bodyStrong = UIFont.systemFont(ofSize: 16, weight: .semibold)
    public static let bodySmall = UIFont.systemFont(ofSize: 14, weight: .regular)
    public static let bodySmallStrong = UIFont.systemFont(ofSize: 14, weight: .semibold)
    public static let input = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    static func font(fromToken token: String) -> UIFont {
        switch token {
        case "titleHero": return titleHero
        case "titlePage": return titlePage
        case "subtitle": return subtitle
        case "heading": return heading
        case "subheading": return subheading
        case "bodyBase": return bodyBase
        case "bodyStrong": return bodyStrong
        case "bodySmall": return bodySmall
        case "bodySmallStrong": return bodySmallStrong
        case "input": return input
        default: return bodyBase
        }
    }
}

