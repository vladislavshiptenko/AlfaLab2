//
//  main.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 02.04.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var featureViewModel: FeaturesViewModel?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        featureViewModel = FeaturesViewModel(features: [], bankService: BankService())
        featureViewModel?.onError = { error in
            print(error)
        }
        featureViewModel?.onLoadingStateChange = { _ in
            print("Loading state changed")
        }
        featureViewModel?.onUpdate = { accounts in
            print(accounts)
        }
        
        let viewModel = AuthViewModel(userService: FakeUserService(), authUserService: FakeAuthUserService())
        let loginVC = AuthView(viewModel: viewModel)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()

        featureViewModel?.fetchBankAccounts()

        return true
    }
}
