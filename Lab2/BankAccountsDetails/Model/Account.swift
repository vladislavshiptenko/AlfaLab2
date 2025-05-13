//
//  Account.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Foundation

struct Account {
    let id: UUID
    var balance: Int
    let number: String
    let accountType: AccountType
    var categories: [String] = []
    init(id: UUID = UUID(), balance: Int, number: String, accountType: AccountType) {
        self.id = id
        self.balance = balance
        self.number = number
        self.accountType = accountType
    }
}
