//
//  AuthViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class AuthViewModel: AuthViewModelProtocol {
    let userService: UserService
    let authUserService: AuthUserService
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
    init(userService: UserService, authUserService: AuthUserService) {
        self.userService = userService
        self.authUserService = authUserService
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
        
        guard let user = userService.getBy(login: userData.login) else {
            opErr = .invalidCredentials
            return
        }

        if user.password == userData.password {
            AuthContext.shared.authUser = authUserService.Add(user: user)
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
