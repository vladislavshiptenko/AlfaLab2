//
//  FakeAuthUserService.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 20.04.2025.
//

struct FakeAuthUserService: AuthUserService {
    func Get() -> AuthUser {
        return AuthUser(accessToken: "token")
    }
    func Add(user: User) -> AuthUser {
        return AuthUser(accessToken: "token")
    }
}
