//
//  FeaturesView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

struct FeaturesView {
    let featuresViewModel: FeaturesViewModel
    init(features: [Feature], authViewModel: AuthViewModel) {
        featuresViewModel = FeaturesViewModel(features: features, authViewModel: authViewModel)
    }
}

