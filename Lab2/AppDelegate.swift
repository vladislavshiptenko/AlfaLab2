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

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let viewModel = AuthViewModel(userService: FakeUserService(), authUserService: FakeAuthUserService())
        let loginVC = AuthView(viewModel: viewModel)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()

        return true
    }
}
