//
//  Router.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

import Foundation
import UIKit

class Router: RouterProtocol {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAuthScreen() {
        let authVC = AuthView(viewModel: AuthViewModel(userService: FakeUserService(), authUserService: FakeAuthUserService()))
        authVC.router = self
        navigationController?.setViewControllers([authVC], animated: true)
    }
    
    func showListScreen() {
        let listVC = BankAccountsView(bankAccountsViewModel: BankAccountsViewModel(bankService: BankService()))
        listVC.router = self
        navigationController?.setViewControllers([listVC], animated: true)
    }
    
    func showDetailScreen(with item: BankAccountViewModel) {
        print("Отображаются детали для ", item.title)
    }
}
