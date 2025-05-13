//
//  ConfigurableCell.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

protocol ConfigurableCell {
    associatedtype ViewModel
    func configure(with viewModel: ViewModel)
}
