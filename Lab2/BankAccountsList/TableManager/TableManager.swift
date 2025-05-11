//
//  TableManager.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

import UIKit

class TableManager: NSObject, TableManagerProtocol {
    weak var delegate: TableManagerDelegate?
    private weak var tableView: UITableView?
    private var items: [BankAccountViewModel] = []
    
    func configure(with tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(GenericCell<BankAccountView>.self, forCellReuseIdentifier: "BankAccountCell")
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func update(with items: [BankAccountViewModel]) {
        self.items = items
        tableView?.reloadData()
        tableView?.refreshControl?.endRefreshing()
    }
    
    func refreshData() {
        delegate?.didRequestRefresh()
    }
    
    @objc private func handleRefresh() {
        refreshData()
    }
}

extension TableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountCell", for: indexPath) as? GenericCell<BankAccountView> else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension TableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        delegate?.didSelectItem(item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
