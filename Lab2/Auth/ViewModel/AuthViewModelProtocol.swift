//
//  AuthViewModelProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 20.04.2025.
//

protocol AuthViewModelProtocol {
    var opErr: AuthError? { get }
    var userData: UserCredentials { get set }
    func login()
}
