//
//  CredentialsStorage.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

protocol AuthUserStorage {
    func Get() -> AuthUser
    func Add(user: User) -> AuthUser
}
