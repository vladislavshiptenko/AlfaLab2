//
//  DSLabel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public final class DSLabel: UILabel {
    private var viewModel: DSLabelViewModel
    
    public init(viewModel: DSLabelViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(with viewModel: DSLabelViewModel) {
        self.viewModel = viewModel
        setupLabel()
    }
    
    private func setupLabel() {
        text = viewModel.text
        textColor = viewModel.textColor
        font = viewModel.font
        textAlignment = viewModel.alignment
        numberOfLines = viewModel.numberOfLines
    }
}
