//
//  ChooseCashbackViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//


class ChooseCashbackViewModel {
    let accountStorage: AccountStorage
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func chooseCashback(id: Int, categories: [String]) {
        var account = accountStorage.getByID(id: id)
        for category in categories {
            account.categories.append(category)
        }
        accountStorage.update(account: account)
    }
}
