//
//  BDUIMapperDelegate.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 18.05.2025.
//

protocol BDUIMapperDelegate: AnyObject {
    func didRequestNavigation(to destination: String, with context: [String: Any]?)
    func didRequestReload(with context: [String: Any]?)
    func didRequestDismiss(with context: [String: Any]?)
    func didExecuteCustomAction(identifier: String, with context: [String: Any]?)
}
