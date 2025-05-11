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
    var router: RouterProtocol?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
                
        let navigationController = UINavigationController()
        router = Router(navigationController: navigationController)
                
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        router?.showAuthScreen()

        return true
    }
}
