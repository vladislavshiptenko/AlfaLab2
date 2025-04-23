//
//  UserService.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

protocol UserService {
    func getBy(id: String) -> User?
    func getBy(login: String) -> User?
    func getBy(token: String) -> User?
}
