//
//  AuthContext.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 08.04.2025.
//

class AuthContext {
    var authUser: AuthUser?
    private static var uniqueInstance: AuthContext?

    private init() {}

    static func shared() -> AuthContext {
        if uniqueInstance == nil {
            uniqueInstance = AuthContext()
        }
        return uniqueInstance!
    }
}
