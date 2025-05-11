//
//  TableManagerDelegateProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

protocol TableManagerDelegate: AnyObject {
    func didSelectItem(_ item: BankAccountViewModel)
    func didRequestRefresh()
}
