//
//  BankAccountsViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine
import Foundation

class BankAccountsViewModel: BankAccountsViewModelProtocol {
    private let bankService: BankServiceProtocol
    
    var onUpdate: (([BankAccountViewModel]) -> Void)?
    var onError: ((String) -> Void)?
    init(bankService: BankServiceProtocol) {
        self.bankService = bankService
    }
    
    func fetchBankAccounts() {
        bankService.loadBankAccounts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let bankAccountsResponse):
                    let viewModels = bankAccountsResponse.map { BankAccountViewModel(account: $0) }
                    self?.onUpdate?(viewModels)
                    
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}
