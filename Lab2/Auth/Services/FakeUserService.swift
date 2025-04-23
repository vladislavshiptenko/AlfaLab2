//
//  FakeUserService.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 20.04.2025.
//

struct FakeUserService: UserStorage {
    func getBy(id: String) -> User? {
        return User(id: "1", fullName: "Test User", login: "test", password: "test123!", permissions: [])
    }
    func getBy(login: String) -> User? {
        return User(id: "1", fullName: "Test User", login: "test", password: "test123!", permissions: [])
    }
    func getBy(token: String) -> User? {
        return User(id: "1", fullName: "Test User", login: "test", password: "test123!", permissions: [])
    }
}
