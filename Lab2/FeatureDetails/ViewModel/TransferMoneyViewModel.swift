//
//  TransferMoneyViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class TransferViewModel {
    let accountStorage: AccountStorage
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func tranferMoney(id: Int, amount: Int) {
        var account = accountStorage.getByID(id: id)
        account.balance += amount
        accountStorage.update(account: account)
    }
}
