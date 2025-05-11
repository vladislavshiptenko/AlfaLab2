//
//  MoneyViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class MoneyViewModel {
    let accountStorage: AccountStorage
    @Published var id: Int?
    @Published var opErr: FeatureError?
    @Published var balance: Int?
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func getBalance() {
        if id == nil {
            opErr = .wrongInput
            return
        }
        
        let account = accountStorage.getByID(id: id!)
        if account == nil {
            opErr = .wrongOperation
            return
        }
        balance = account!.balance
    }
}
