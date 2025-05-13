//
//  DSTextField.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 11.05.2025.
//

import UIKit

public final class DSTextField: UITextField {
    public typealias TextChangeHandler = (String) -> Void
    
    private var viewModel: DSTextFieldViewModel
    private var textChangeHandler: TextChangeHandler?
    
    private var padding = UIEdgeInsets(
        top: DSSpacingTokens.space200,
        left: DSSpacingTokens.space200,
        bottom: DSSpacingTokens.space200,
        right: DSSpacingTokens.space200
    )
    
    public init(viewModel: DSTextFieldViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    public func update(with viewModel: DSTextFieldViewModel) {
        self.viewModel = viewModel
        setupTextField()
    }
    
    public func setTextChangeHandler(_ handler: @escaping TextChangeHandler) {
        textChangeHandler = handler
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    private func setupTextField() {
        placeholder = viewModel.placeholder
        textColor = viewModel.textColor
        font = viewModel.font
        backgroundColor = viewModel.backgroundColor
        layer.cornerRadius = viewModel.cornerRadius
        layer.borderWidth = viewModel.borderWidth
        layer.borderColor = viewModel.borderColor.cgColor
        isSecureTextEntry = viewModel.isSecure
        autocapitalizationType = viewModel.autocapitalizationType
        autocorrectionType = viewModel.autocorrectionType
        
        if let leftIcon = viewModel.leftIcon {
            padding.left = DSSpacingTokens.space600
            
            let leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            leftView.image = leftIcon
            leftView.contentMode = .scaleAspectFit
            leftView.tintColor = DSColorTokens.neutralSecondary
            self.leftView = leftView
            self.leftViewMode = .always
        } else {
            self.leftView = nil
            self.leftViewMode = .never
        }
    }
    
    @objc private func textDidChange() {
        textChangeHandler?(text ?? "")
    }
}
