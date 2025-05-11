//
//  FeaturesView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 10.05.2025.
//

import UIKit

class BankAccountsView: UIViewController {
    weak var router: RouterProtocol?
    
    private let tableView = UITableView()
    private var tableManager: TableManagerProtocol
    private var bankAccountsViewModel: BankAccountsViewModelProtocol
    
    init(bankAccountsViewModel: BankAccountsViewModelProtocol) {
        self.bankAccountsViewModel = bankAccountsViewModel
        self.tableManager = TableManager()
        super.init(nibName: nil, bundle: nil)
        
        self.bankAccountsViewModel.onError = { error in
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        self.bankAccountsViewModel.onUpdate = { accounts in
            self.tableManager.update(with: accounts)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableManager()
        loadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Bank Accounts"
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableManager() {
        tableManager.delegate = self
        tableManager.configure(with: tableView)
    }
    
    private func loadData() {
        bankAccountsViewModel.fetchBankAccounts()
    }
}

extension BankAccountsView: TableManagerDelegate {
    func didSelectItem(_ item: BankAccountViewModel) {
        router?.showDetailScreen(with: item)
    }
    
    func didRequestRefresh() {
        loadData()
    }
}
