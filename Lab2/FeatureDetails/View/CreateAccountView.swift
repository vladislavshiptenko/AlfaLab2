//
//  CreateAccountView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class CreateAccountView {
    let createAccountViewModel: CreateAccountViewModel
    init(accountStorage: AccountStorage) {
        createAccountViewModel = CreateAccountViewModel(accountStorage: accountStorage)
    }
}

