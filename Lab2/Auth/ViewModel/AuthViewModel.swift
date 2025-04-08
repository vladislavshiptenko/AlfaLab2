//
//  AuthViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class AuthViewModel: ObservableObject {
    let userStorage: UserStorage
    let authUserStorage: AuthUserStorage
    @Published var userData: User?
    @Published var opErr: AuthError?
    init(userStorage: UserStorage, authUserStorage: AuthUserStorage) {
        self.userStorage = userStorage
        self.authUserStorage = authUserStorage
    }

    func auth() {
        if userData == nil {
            opErr = .wrongInput
            return
        }
        
        let user = userStorage.getByLogin(login: userData!.login)
        if user == nil {
            opErr = .invalidCredentials
            return
        }
        
        if user!.password == userData!.password {
            AuthContext.shared().authUser = authUserStorage.Add(user: user!)
        } else {
            opErr = .invalidCredentials
        }
        
        return
    }
}
