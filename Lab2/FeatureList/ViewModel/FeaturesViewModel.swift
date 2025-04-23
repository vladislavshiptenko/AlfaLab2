//
//  FeaturesViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine
import Foundation

class FeaturesViewModel: FeaturesViewModelProtocol {
    private var features: [Feature]
    private let bankService: BankServiceProtocol
    @Published var filteredFeatures: [Feature]?
    @Published var opErr: ListError?
    
    var onUpdate: (([BankAccountViewModel]) -> Void)?
    var onLoadingStateChange: ((Bool) -> Void)?
    var onError: ((String) -> Void)?
    init(features: [Feature], bankService: BankServiceProtocol) {
        self.features = features
        self.bankService = bankService
    }

    func getFeatures() {
        var featuresWithPermissions: [Feature] = []
        
        guard let token = AuthContext.shared.authUser?.accessToken, !token.isEmpty else {
            opErr = .emptyToken
            return
        }

        guard let perms = getPermissionsByToken(token: token) else {
            opErr = .invalidToken
            return
        }

        for feature in features {
            var ok = true
            for permission in feature.permissions {
                if !perms.contains(permission.rawValue) {
                    ok = false
                    break
                }
            }
            
            if ok {
                featuresWithPermissions.append(feature)
            }
        }
        
        if featuresWithPermissions.count == 0 {
            opErr = .emptyList
        } else {
            filteredFeatures = featuresWithPermissions
        }
    }
    
    func fetchBankAccounts() {
        onLoadingStateChange?(true)
        
        bankService.loadBankAccounts { [weak self] result in
            DispatchQueue.main.async {
                self?.onLoadingStateChange?(false)
                
                switch result {
                case .success(let bankAccountsResponse):
                    let viewModels = bankAccountsResponse.map { BankAccountViewModel(account: $0) }
                    self?.onUpdate?(viewModels)
                    
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}
