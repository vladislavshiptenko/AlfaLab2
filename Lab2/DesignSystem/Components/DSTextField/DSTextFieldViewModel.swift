//
//  DSTextFieldViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public struct DSTextFieldViewModel {
    let placeholder: String
    let textColor: UIColor
    let font: UIFont
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: UIColor
    let isSecure: Bool
    let autocapitalizationType: UITextAutocapitalizationType
    let autocorrectionType: UITextAutocorrectionType
    let leftIcon: UIImage?
    
    public init(
        placeholder: String,
        textColor: UIColor = DSColorTokens.brandDefault,
        font: UIFont = DSTypographyTokens.bodyBase,
        backgroundColor: UIColor = DSColorTokens.baseDefault,
        cornerRadius: CGFloat = DSRadiusTokens.base,
        borderWidth: CGFloat = 1,
        borderColor: UIColor = DSColorTokens.neutralDefault,
        isSecure: Bool = false,
        autocapitalizationType: UITextAutocapitalizationType = .sentences,
        autocorrectionType: UITextAutocorrectionType = .default,
        leftIcon: UIImage? = nil
    ) {
        self.placeholder = placeholder
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.isSecure = isSecure
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.leftIcon = leftIcon
    }
    
    public static func standard(placeholder: String) -> DSTextFieldViewModel {
        DSTextFieldViewModel(placeholder: placeholder)
    }
    
    public static func search(placeholder: String) -> DSTextFieldViewModel {
        DSTextFieldViewModel(
            placeholder: placeholder,
            leftIcon: UIImage(systemName: "magnifyingglass")
        )
    }
    
    public static func password(placeholder: String) -> DSTextFieldViewModel {
        DSTextFieldViewModel(
            placeholder: placeholder,
            isSecure: true,
            leftIcon: UIImage(systemName: "lock")
        )
    }
    
    public static func email(placeholder: String) -> DSTextFieldViewModel {
        DSTextFieldViewModel(
            placeholder: placeholder,
            autocapitalizationType: .none,
            autocorrectionType: .no,
            leftIcon: UIImage(systemName: "envelope")
        )
    }
}
