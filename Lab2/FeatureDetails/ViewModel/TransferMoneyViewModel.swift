//
//  TransferMoneyViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class TransferViewModel {
    let accountStorage: AccountStorage
    @Published var id: Int?
    @Published var amount: Int?
    @Published var opErr: FeatureError?
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func tranferMoney() {
        if id == nil || amount == nil {
            opErr = .wrongInput
            return
        }
        
        var account = accountStorage.getByID(id: id!)
        if account == nil {
            opErr = .wrongOperation
            return
        }
        
        if amount! > account!.balance {
            opErr = .wrongOperation
            return
        }
        account!.balance -= amount!
        
        let ok = accountStorage.update(account: account!)
        if amount! > account!.balance {
            opErr = .wrongOperation
        }
    }
}
