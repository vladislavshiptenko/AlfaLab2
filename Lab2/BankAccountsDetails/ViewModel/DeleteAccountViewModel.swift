//
//  DeleteAccountViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class DeleteAccountViewModel {
    let accountStorage: AccountStorage
    @Published var id: Int?
    @Published var opErr: FeatureError?
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
    }
    
    func deleteAccount() {
        if id == nil {
            opErr = .wrongInput
            return
        }
        
        let ok = accountStorage.delete(id: id!)
        if !ok {
            opErr = .wrongOperation
            return
        }
    }
}
