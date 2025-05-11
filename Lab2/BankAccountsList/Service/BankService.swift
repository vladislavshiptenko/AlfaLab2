//
//  BankService.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 22.04.2025.
//

import Foundation

class BankService: BankServiceProtocol {
    private let urlString = "https://postman-echo.com/post"

    func loadBankAccounts(completion: @escaping (Result<[BankAccountResponse], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "URL Error", code: 0)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let requestBody = [
            BankAccountResponse(id: "1", accountNumber: "1", holderName: "Vlad", balance: 100, currency: "RUB"),
            BankAccountResponse(id: "2", accountNumber: "3", holderName: "Vlad", balance: 200, currency: "RUB"),
            BankAccountResponse(id: "3", accountNumber: "5", holderName: "Vlad", balance: 500, currency: "RUB"),
            BankAccountResponse(id: "4", accountNumber: "9", holderName: "Vlad", balance: 700, currency: "RUB"),
            BankAccountResponse(id: "5", accountNumber: "8", holderName: "Vlad", balance: 1000, currency: "RUB"),
            BankAccountResponse(id: "6", accountNumber: "15", holderName: "Vlad", balance: 10000, currency: "RUB"),
            BankAccountResponse(id: "7", accountNumber: "16", holderName: "Vlad", balance: 20000, currency: "RUB"),
            BankAccountResponse(id: "8", accountNumber: "17", holderName: "Vlad", balance: 30000, currency: "RUB"),
            BankAccountResponse(id: "9", accountNumber: "18", holderName: "Vlad", balance: 45000, currency: "RUB"),
            BankAccountResponse(id: "10", accountNumber: "19", holderName: "Vlad", balance: 90000, currency: "RUB"),
            BankAccountResponse(id: "11", accountNumber: "20", holderName: "Vlad", balance: 100000, currency: "RUB"),
            BankAccountResponse(id: "12", accountNumber: "21", holderName: "Vlad", balance: 20000, currency: "RUB"),
            BankAccountResponse(id: "13", accountNumber: "22", holderName: "Vlad", balance: 0, currency: "RUB"),
            BankAccountResponse(id: "14", accountNumber: "23", holderName: "Vlad", balance: 0, currency: "RUB"),
            BankAccountResponse(id: "15", accountNumber: "24", holderName: "Vlad", balance: 0, currency: "RUB"),
            BankAccountResponse(id: "16", accountNumber: "25", holderName: "Vlad", balance: 0, currency: "RUB"),
            BankAccountResponse(id: "17", accountNumber: "26", holderName: "Vlad", balance: 0, currency: "RUB"),
            BankAccountResponse(id: "18", accountNumber: "27", holderName: "Vlad", balance: 0, currency: "RUB"),
            BankAccountResponse(id: "19", accountNumber: "28", holderName: "Vlad", balance: 0, currency: "RUB"),
        ]
        
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            
            do {
                let accounts = try JSONDecoder().decode(BankAccountResponseJSON.self, from: data)
                completion(.success(accounts.json))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
