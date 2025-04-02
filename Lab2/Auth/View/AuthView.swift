//
//  AuthView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

struct AuthView {
    let authViewModel: AuthViewModel
    init(userStorage: UserStorage, authUserStorage: AuthUserStorage) {
        authViewModel = AuthViewModel(userStorage: userStorage, authUserStorage: authUserStorage)
    }
}

