//
//  TableManagerProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

import UIKit

protocol TableManagerProtocol {
    var delegate: TableManagerDelegate? { get set }
    func configure(with tableView: UITableView)
    func update(with items: [BankAccountViewModel])
    func refreshData()
}
