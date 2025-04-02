//
//  MoneyViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class MoneyViewModel {
    let accountStorage: AccountStorage
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func getBalance(id: Int) -> Int {
        let account = accountStorage.getByID(id: id)
        return account.balance
    }
}
