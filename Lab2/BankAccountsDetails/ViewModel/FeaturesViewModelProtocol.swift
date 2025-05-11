//
//  FeaturesViewModelProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

protocol FeaturesViewModelProtocol {
    var filteredFeatures: [Feature]? { get }
    var opErr: ListError? { get }
    
    func getFeatures()
}
