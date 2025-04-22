//
//  FeaturesViewModelProtocol.swift
//  test2
//
//  Created by Vladislav Shiptenko on 22.04.2025.
//

protocol FeaturesViewModelProtocol {
    var filteredFeatures: [Feature]? { get }
    var opErr: ListError? { get }

    var onUpdate: (([BankAccountViewModel]) -> Void)? { get set }
    var onLoadingStateChange: ((Bool) -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    
    func getFeatures()
    func fetchBankAccounts()
}
