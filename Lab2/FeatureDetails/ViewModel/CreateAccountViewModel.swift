//
//  CreateAccountViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class CreateAccountViewModel {
    let accountStorage: AccountStorage
    @Published var balance: Int?
    @Published var number: String?
    @Published var accountType: AccountType?
    @Published var account: Account?
    @Published var opErr: FeatureError?
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func createAccount() {
        if balance == nil || number == nil || accountType == nil {
            opErr = .wrongInput
            return
        }
        
        let account = Account(balance: balance!, number: number!, accountType: accountType!)
        self.account = accountStorage.add(account: account)
    }
}
