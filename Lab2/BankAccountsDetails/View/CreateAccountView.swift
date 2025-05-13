//
//  CreateAccountView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import UIKit

protocol CreateAccountView {
    var createAccountViewModel: CreateAccountViewModel { get set }
    func binding()
}

