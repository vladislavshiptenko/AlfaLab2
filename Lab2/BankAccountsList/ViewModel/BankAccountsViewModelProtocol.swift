//
//  BankAccountsViewModelProtocol.swift
//  test2
//
//  Created by Vladislav Shiptenko on 22.04.2025.
//

protocol BankAccountsViewModelProtocol {
    var onUpdate: (([BankAccountViewModel]) -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    func fetchBankAccounts()
}
