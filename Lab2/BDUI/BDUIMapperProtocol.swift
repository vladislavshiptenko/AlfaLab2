//
//  BDUIMapperProtocol.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 18.05.2025.
//

import UIKit

protocol BDUIMapperProtocol {
    func map(model: BDUIModel) -> UIView
    func handleAction(_ action: ActionModel)
}
