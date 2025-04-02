//
//  CreateAccountViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class CreateAccountViewModel {
    let accountStorage: AccountStorage
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func createAccount(balance: Int, number: String, accountType: AccountType) -> Account {
        let account = Account(balance: balance, number: number, accountType: accountType)
        return accountStorage.add(account: account)
    }
}
