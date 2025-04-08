//
//  AuthView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import UIKit

protocol AuthView {
    var authViewModel: AuthViewModel { get set }
    func binding()
}

