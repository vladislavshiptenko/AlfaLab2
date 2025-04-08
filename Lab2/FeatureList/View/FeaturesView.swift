//
//  FeaturesView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

protocol FeaturesView {
    var featuresViewModel: FeaturesViewModel { get set }
    func binding()
}

