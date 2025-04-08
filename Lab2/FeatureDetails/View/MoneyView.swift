//
//  MoneyView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 08.04.2025.
//

import UIKit

protocol MoneyView {
    var moneyViewModel: MoneyViewModel { get set }
    func binding()
}
