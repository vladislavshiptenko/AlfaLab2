//
//  DSButtonViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public struct DSButtonViewModel {
    let title: String
    let titleColor: UIColor
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let font: UIFont
    let borderWidth: CGFloat
    let contentInsets: CGFloat
    let borderColor: UIColor?
    let buttonSize: UIButton.Configuration.Size
    
    public init(
        title: String,
        buttonSize: UIButton.Configuration.Size = .medium,
        contentInsets: CGFloat = DSSpacingTokens.space300,
        titleColor: UIColor = DSColorTokens.baseDefault,
        backgroundColor: UIColor = DSColorTokens.brandDefault,
        cornerRadius: CGFloat = DSRadiusTokens.base,
        font: UIFont = DSTypographyTokens.bodyBase,
        borderWidth: CGFloat = 0,
        borderColor: UIColor? = nil
    ) {
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.buttonSize = buttonSize
        self.contentInsets = contentInsets
    }
    
    public static func primaryMedium(_ title: String) -> DSButtonViewModel {
        DSButtonViewModel(title: title)
    }
    
    public static func primarySmall(_ title: String) -> DSButtonViewModel {
        DSButtonViewModel(title: title, buttonSize: .small, contentInsets: DSSpacingTokens.space200)
    }
    
    public static func neutralMedium(_ title: String) -> DSButtonViewModel {
        DSButtonViewModel(
            title: title,
            titleColor: DSColorTokens.brandDefault,
            backgroundColor: DSColorTokens.neutralSecondary,
            borderWidth: 1,
            borderColor: DSColorTokens.neutralDefault,
        )
    }
    
    public static func neutralSmall(_ title: String) -> DSButtonViewModel {
        DSButtonViewModel(
            title: title,
            buttonSize: .small,
            contentInsets: DSSpacingTokens.space200,
            titleColor: DSColorTokens.brandDefault,
            backgroundColor: DSColorTokens.neutralSecondary,
            borderWidth: 1,
            borderColor: DSColorTokens.neutralDefault,
        )
    }
}
