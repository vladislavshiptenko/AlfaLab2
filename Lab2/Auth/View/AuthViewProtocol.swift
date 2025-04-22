//
//  AuthViewProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import UIKit

protocol AuthViewProtocol {
    func showValidationError(_ errorMessage: String)
    func clearValidationErrors()
    func handleSuccessfulLogin()
    func showLoginError(_ errorMessage: String)
}
