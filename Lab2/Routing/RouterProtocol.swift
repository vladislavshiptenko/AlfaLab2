//
//  RouterProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

protocol RouterProtocol: AnyObject {
    func showAuthScreen()
    func showListScreen()
    func showDetailScreen(with item: BankAccountViewModel)
}
