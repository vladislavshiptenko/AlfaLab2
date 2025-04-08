//
//  UserStorage.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

protocol UserStorage {
    func getByID(id: Int) -> User?
    func getByLogin(login: String) -> User?
    func getByToken(token: String) -> User?
}
