//
//  DeleteAccountView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 08.04.2025.
//

import UIKit

protocol DeleteAccountView {
    var deleteAccountViewModel: DeleteAccountViewModel { get set }
    func binding()
}
