//
//  FeaturesViewModel.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

class FeaturesViewModel {
    let features: [Feature]
    let authViewModel: AuthViewModel
    init(features: [Feature], authViewModel: AuthViewModel) {
        self.features = features
        self.authViewModel = authViewModel
    }

    func getFeatures() -> [Feature] {
        var featuresWithPermissions: [Feature] = []
        
        let token = authViewModel.getToken()
        if token == nil {
            return []
        }
        let perms = authViewModel.getByToken(token: token!).permissions
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
        
        return featuresWithPermissions
    }
}
