//
//  AccountStorage.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//


protocol AccountStorage {
    func getByID(id: Int) -> Account
    func add(account: Account) -> Account
    func update(account: Account)
    func delete(id: Int)
}
