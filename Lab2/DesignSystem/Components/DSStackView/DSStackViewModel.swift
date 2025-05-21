//
//  DSStackViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public struct DSStackViewModel {
    var axis: NSLayoutConstraint.Axis
    var spacing: CGFloat
    var alignment: UIStackView.Alignment
    var distribution: UIStackView.Distribution
    var padding: UIEdgeInsets
    
    public init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = DSSpacingTokens.space300,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        padding: UIEdgeInsets = .zero
    ) {
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.padding = padding
    }
    
    public static func vertical(spacing: CGFloat = DSSpacingTokens.space300) -> DSStackViewModel {
        DSStackViewModel(axis: .vertical, spacing: spacing)
    }
    
    public static func horizontal(spacing: CGFloat = DSSpacingTokens.space300) -> DSStackViewModel {
        DSStackViewModel(axis: .horizontal, spacing: spacing)
    }
    
    public static func verticalCentered(spacing: CGFloat = DSSpacingTokens.space300) -> DSStackViewModel {
        DSStackViewModel(axis: .vertical, spacing: spacing, alignment: .center)
    }
    
    public static func horizontalCentered(spacing: CGFloat = DSSpacingTokens.space300) -> DSStackViewModel {
        DSStackViewModel(axis: .horizontal, spacing: spacing, alignment: .center)
    }
    
    public static func verticalWithPadding(spacing: CGFloat = DSSpacingTokens.space300, padding: UIEdgeInsets) -> DSStackViewModel {
        DSStackViewModel(
            axis: .vertical,
            spacing: spacing,
            padding: padding
        )
    }

    static func stackView(fromToken token: String) -> DSStackViewModel {
        switch token {
        case "vertical": return vertical()
        case "horizontal": return horizontal()
        case "verticalCentered": return verticalCentered()
        case "horizontalCentered": return horizontalCentered()
        default: return vertical()
        }
    }
}
