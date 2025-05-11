//
//  TransferView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 08.04.2025.
//

import UIKit

protocol TransferView {
    var transferViewModel: TransferViewModel { get set }
    func binding()
}
