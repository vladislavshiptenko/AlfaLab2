//
//  ChooseCashbackViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class ChooseCashbackViewModel {
    let accountStorage: AccountStorage
    @Published var id: Int?
    @Published var categories: [String]?
    @Published var opErr: FeatureError?
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func chooseCashback() {
        if id == nil || categories == nil {
            opErr = .wrongInput
            return
        }
        
        var account = accountStorage.getByID(id: id!)
        if account == nil {
            opErr = .wrongOperation
            return
        }
        
        for category in categories! {
            account!.categories.append(category)
        }
        
        let ok = accountStorage.update(account: account!)
        if !ok {
            opErr = .wrongOperation
        }
    }
}
