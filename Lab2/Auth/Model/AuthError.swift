//
//  AuthError.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 08.04.2025.
//

enum AuthError: String, Error {
    case invalidCredentials = "Invalid credentials"
    case wrongLoginInput = "Incorrect login input"
    case wrongPasswordInput = "Incorrect password input"
}
