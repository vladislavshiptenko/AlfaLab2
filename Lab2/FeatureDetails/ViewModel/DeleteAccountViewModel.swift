//
//  DeleteAccountViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class DeleteAccountViewModel {
    let accountStorage: AccountStorage
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func deleteAccount(id: Int) {
        accountStorage.delete(id: id)
    }
}
