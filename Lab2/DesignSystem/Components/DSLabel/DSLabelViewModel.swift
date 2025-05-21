//
//  DSLabelViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public struct DSLabelViewModel {
    var text: String
    var textColor: UIColor
    var font: UIFont
    var alignment: NSTextAlignment
    var numberOfLines: Int
    
    public init(
        text: String,
        textColor: UIColor = DSColorTokens.brandDefault,
        font: UIFont = DSTypographyTokens.bodyBase,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
        self.numberOfLines = numberOfLines
    }
    
    public static func titleHero(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, font: DSTypographyTokens.titleHero)
    }
    
    public static func titlePage(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, font: DSTypographyTokens.titlePage)
    }
    
    public static func subtitle(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, font: DSTypographyTokens.subtitle)
    }
    
    public static func heading(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, font: DSTypographyTokens.heading)
    }
    
    public static func subheading(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, font: DSTypographyTokens.subheading)
    }
    
    public static func bodyBase(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text)
    }
    
    public static func bodySmall(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, font: DSTypographyTokens.bodySmall)
    }
    
    public static func error(_ text: String) -> DSLabelViewModel {
        DSLabelViewModel(text: text, textColor: DSColorTokens.errorDefault, font: DSTypographyTokens.bodyBase)
    }
    
    static func label(fromToken token: String) -> DSLabelViewModel {
        switch token {
        case "titleHero": return titleHero("")
        case "titlePage": return titlePage("")
        case "subtitle": return subtitle("")
        case "heading": return heading("")
        case "subheading": return subheading("")
        case "bodyBase": return bodyBase("")
        case "bodySmall": return bodySmall("")
        case "error": return error("")
        default: return bodyBase("")
        }
    }
}
