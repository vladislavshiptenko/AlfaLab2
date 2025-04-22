//
//  AuthView.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 20.04.2025.
//

import UIKit

final class AuthView: UIViewController, AuthViewProtocol {
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите login"
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        return textField
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()

    private var viewModel: AuthViewModelProtocol

    init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) не поддерживается в этом примере.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [
            loginTextField,
            passwordTextField,
            errorLabel,
            loginButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ])
    }

    @objc private func didChangeText(_ textField: UITextField) {
        if textField == loginTextField {
            viewModel.userData.login = textField.text ?? ""
        } else if textField == passwordTextField {
            viewModel.userData.password = textField.text ?? ""
        }
        
        if let opErr = viewModel.opErr{
            if opErr == .wrongLoginInput || opErr == .wrongPasswordInput {
                showValidationError(opErr.rawValue)
            }
        } else {
            clearValidationErrors()
        }
    }

    @objc private func didTapLoginButton() {
        viewModel.login()
        if let opErr = viewModel.opErr {
            showValidationError(opErr.rawValue)
        } else {
            handleSuccessfulLogin()
        }
    }

    func showValidationError(_ errorMessage: String) {
        errorLabel.isHidden = false
        errorLabel.text = errorMessage
    }

    func clearValidationErrors() {
        errorLabel.isHidden = true
        errorLabel.text = nil
    }

    func handleSuccessfulLogin() {
        clearValidationErrors()
        
        print("Авторизация прошла успешно! Переход на экран со списком фичей...")
    }

    func showLoginError(_ errorMessage: String) {
        showValidationError(errorMessage)
    }
}
