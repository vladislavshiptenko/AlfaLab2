//
//  FeaturesViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import Combine

class FeaturesViewModel {
    let features: [Feature]
    @Published var filteredFeatures: [Feature]?
    @Published var opErr: ListError?
    init(features: [Feature]) {
        self.features = features
    }

    func getFeatures() {
        var featuresWithPermissions: [Feature] = []
        
        let token = AuthContext.shared().authUser?.accessToken
        if token == nil || token!.isEmpty {
            opErr = .emptyToken
            return
        }
        let perms = getPermissionsByToken(token: token!)
        
        if perms == nil {
            opErr = .invalidToken
            return
        }
        for feature in features {
            var ok = true
            for permission in feature.permissions {
                if !perms!.contains(permission.rawValue) {
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
