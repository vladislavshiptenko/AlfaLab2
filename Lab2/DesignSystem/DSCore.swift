//
//  DSCore.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public enum DS {
    public static func label(with viewModel: DSLabelViewModel) -> DSLabel {
        DSLabel(viewModel: viewModel)
    }
    
    public static func button(with viewModel: DSButtonViewModel) -> DSButton {
        DSButton(viewModel: viewModel)
    }
    
    public static func textField(with viewModel: DSTextFieldViewModel) -> DSTextField {
        DSTextField(viewModel: viewModel)
    }
    
    public static func stackView(with viewModel: DSStackViewModel) -> DSStackView {
        DSStackView(viewModel: viewModel)
    }
}

