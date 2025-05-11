//
//  ChooseCashbackView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 08.04.2025.
//

import UIKit

protocol ChooseCashbackView {
    var chooseCashbackViewModel: ChooseCashbackViewModel { get set }
    func binding()
}
