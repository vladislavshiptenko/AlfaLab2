//
//  AuthViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class AuthViewModel: AuthViewModelProtocol {
    let userStorage: UserStorage
    let authUserStorage: AuthUserStorage
    @Published var userData: UserCredentials = UserCredentials(login: "", password: "") {
        didSet {
            if !validatePassword() {
                opErr = .wrongPasswordInput
            } else if !validateLogin() {
                opErr = .wrongLoginInput
            } else {
                opErr = nil
            }
        }
    }
    @Published var opErr: AuthError?
    init(userStorage: UserStorage, authUserStorage: AuthUserStorage) {
        self.userStorage = userStorage
        self.authUserStorage = authUserStorage
    }

    func login() {
        if !validatePassword() {
            opErr = .wrongPasswordInput
            return
        }
        
        if !validateLogin() {
            opErr = .wrongLoginInput
            return
        }
        
        let user = userStorage.getBy(login: userData.login)
        if user == nil {
            opErr = .invalidCredentials
            return
        }
        
        if user!.password == userData.password {
            AuthContext.shared().authUser = authUserStorage.Add(user: user!)
        } else {
            opErr = .invalidCredentials
        }
        
        return
    }
    
    private func validateLogin() -> Bool {
        return !userData.login.isEmpty
    }

    private func validatePassword() -> Bool {
        return userData.password.count >= 6 && userData.password.contains("!")
    }
}
