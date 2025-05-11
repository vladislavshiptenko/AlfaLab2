//
//  BankServiceProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 22.04.2025.
//

protocol BankServiceProtocol {
    func loadBankAccounts(completion: @escaping (Result<[BankAccountResponse], Error>) -> Void)
}
