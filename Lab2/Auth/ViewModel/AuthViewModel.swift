//
//  AuthViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class AuthViewModel {
    let user: AuthUser?
    let userStorage: UserStorage
    let authUserStorage: AuthUserStorage
    init(userStorage: UserStorage, authUserStorage: AuthUserStorage) {
        self.userStorage = userStorage
        self.authUserStorage = authUserStorage
        user = nil
    }

    func getToken() -> String? {
        return user?.accessToken
    }
    
    func getByToken(token: String) -> User {
        return userStorage.getByToken(token: token)
    }

    func auth(login: String, password: String) -> AuthUser? {
        let user = userStorage.getByLogin(login: login)
        if user.password == password {
            return authUserStorage.Add(user: user)
        }
        
        return nil
    }
}
