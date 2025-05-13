//
//  DSStackView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public final class DSStackView: UIStackView {
    private var viewModel: DSStackViewModel
    
    public init(viewModel: DSStackViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(with viewModel: DSStackViewModel) {
        self.viewModel = viewModel
        setupStackView()
    }
    
    private func setupStackView() {
        axis = viewModel.axis
        spacing = viewModel.spacing
        alignment = viewModel.alignment
        distribution = viewModel.distribution
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = viewModel.padding
        translatesAutoresizingMaskIntoConstraints = false
    }
}
