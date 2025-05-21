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
        let authJsonView = """
            {
                "type": "stackView",
                "subviews": [
                    {
                        "type": "textField",
                        "content": {
                            "textFieldType": "email",
                            "placeholder": "Введите логин"
                        }
                    },
                    {
                        "type": "textField",
                        "content": {
                            "textFieldType": "password",
                            "placeholder": "Введите логин"
                        }
                    },
                    {
                        "type": "label",
                        "content": {
                            "labelType": "error",
                            "text": "Неправильные данные"
                        }
                    },
                    {
                        "type": "button",
                        "content": {
                            "buttonType": "primaryMedium",
                            "text": "Войти",
                            "action": {
                                "type": "print",
                                "context": {
                                    "message": "Button was pressed"
                                }
                            }
                        }
                    }
                ]
            }
            """

        let configuration: BDUIScreenConfiguration = .init(endpoint: "https://postman-echo.com/post", title: "auth", httpMethod: "POST", body: authJsonView.data(using: .utf8))
        let mapper = BDUIMapper()
        let auth_bdui = BDUIView(configuration: configuration, mapper: mapper)
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = auth_bdui
        window?.makeKeyAndVisible()

        return true
    }
}
