//
//  BankAccountResponse.swift
//  test2
//
//  Created by Vladislav Shiptenko on 22.04.2025.
//

struct BankAccountResponseJSON: Codable {
    let json: [BankAccountResponse]
}

struct BankAccountResponse: Codable {
    let id: String
    let accountNumber: String
    let holderName: String
    let balance: Int
    let currency: String
}
