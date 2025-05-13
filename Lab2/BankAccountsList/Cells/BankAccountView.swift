//
//  BankAccountView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

import UIKit

class BankAccountView: UIView, CellViewProtocol {
    private let titleLabel = DS.label(with: DSLabelViewModel.bodyBase(""))
    private let subtitleLabel = DS.label(with: DSLabelViewModel.bodySmall(""))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        subtitleLabel.textColor = DSColorTokens.neutralSecondary
        
        let stackView = DS.stackView(with: DSStackViewModel.vertical(spacing: DSSpacingTokens.space100))
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setup(with viewModel: BankAccountViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.balanceString
    }
}
