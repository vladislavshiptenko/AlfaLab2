//
//  CellView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//


protocol CellViewProtocol {
    associatedtype ViewModel
    func setup(with viewModel: ViewModel)
}
