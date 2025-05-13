//
//  FeaturesViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

final class FeaturesViewModel: FeaturesViewModelProtocol {
    private var features: [Feature]
    
    @Published var filteredFeatures: [Feature]?
    @Published var opErr: ListError?
    
    init(features: [Feature]) {
        self.features = features
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
}
