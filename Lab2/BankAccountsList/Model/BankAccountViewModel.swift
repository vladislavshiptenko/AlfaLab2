//
//  BankAccountViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 22.04.2025.
//

struct BankAccountViewModel {
    let title: String
    let balanceString: String
    
    init(account: BankAccountResponse) {
        self.title = "Счёт №\(account.accountNumber) / \(account.holderName)"
        
        let formattedBalance = String(format: "%d.%d", account.balance/100, account.balance%100)
        self.balanceString = "Баланс: \(formattedBalance) \(account.currency)"
    }
}
