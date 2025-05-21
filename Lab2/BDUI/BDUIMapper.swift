//
//  BDUIMapper.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 18.05.2025.
//

import UIKit

class BDUIMapper: BDUIMapperProtocol {
    weak var delegate: BDUIMapperDelegate?
    
    init(delegate: BDUIMapperDelegate? = nil) {
        self.delegate = delegate
    }
    
    func map(model: BDUIModel) -> UIView {
        switch model.type {
        case .stackView:
            return mapStackView(model: model)
        case .label:
            return mapLabel(model: model)
        case .button:
            return mapButton(model: model)
        case .textField:
            return mapTextField(model: model)
        }
    }
    
    private func mapStackView(model: BDUIModel) -> UIView {
        var stackViewModel = DSStackViewModel.vertical()
        
        if let stackViewType = model.content?.string(forKey: "stackViewType") {
            stackViewModel = DSStackViewModel.stackView(fromToken: stackViewType)
        }
                
        if let spacing = model.content?.string(forKey: "spacing") {
            stackViewModel.spacing = DSSpacingTokens.spacing(fromToken: spacing)
        }
        
        if let alignmentStr = model.content?.string(forKey: "alignment") {
            switch alignmentStr {
            case "fill": stackViewModel.alignment = .fill
            case "leading": stackViewModel.alignment = .leading
            case "trailing": stackViewModel.alignment = .trailing
            case "center": stackViewModel.alignment = .center
            default: stackViewModel.alignment = .fill
            }
        }
        
        if let distributionStr = model.content?.string(forKey: "distribution") {
            switch distributionStr {
            case "fill": stackViewModel.distribution = .fill
            case "fillEqually": stackViewModel.distribution = .fillEqually
            case "fillProportionally": stackViewModel.distribution = .fillProportionally
            case "equalSpacing": stackViewModel.distribution = .equalSpacing
            case "equalCentering": stackViewModel.distribution = .equalCentering
            default: stackViewModel.distribution = .fill
            }
        }
        
        let stackView = DS.stackView(with: stackViewModel)
        
        if let subviews = model.subviews {
            for subviewModel in subviews {
                let subview = map(model: subviewModel)
                stackView.addArrangedSubview(subview)
            }
        }
        
        return stackView
    }
    
    private func mapLabel(model: BDUIModel) -> UIView {
        var labelViewModel = DSLabelViewModel.bodyBase("")
        
        if let labelType = model.content?.string(forKey: "labelType") {
            labelViewModel = DSLabelViewModel.label(fromToken: labelType)
        }
        
        if let text = model.content?.string(forKey: "text") {
            labelViewModel.text = text
        }
        
        if let font = model.content?.string(forKey: "font") {
           labelViewModel.font = DSTypographyTokens.font(fromToken: font)
        }
        
        if let textColor = model.content?.string(forKey: "textColor") {
            labelViewModel.textColor = DSColorTokens.color(fromToken: textColor)
        }

        if let alignmentStr = model.content?.string(forKey: "alignment") {
            switch alignmentStr {
            case "left": labelViewModel.alignment = .left
            case "center": labelViewModel.alignment = .center
            case "right": labelViewModel.alignment = .right
            default: labelViewModel.alignment = .natural
            }
        }
        
        if let numberOfLines = model.content?.int(forKey: "numberOfLines") {
            labelViewModel.numberOfLines = numberOfLines
        } else {
            labelViewModel.numberOfLines = 0
        }
        
        return DS.label(with: labelViewModel)
    }
    
    private func mapButton(model: BDUIModel) -> UIView {
        var buttonViewModel = DSButtonViewModel.primaryMedium("")
        
        if let buttonType = model.content?.string(forKey: "buttonType") {
            buttonViewModel = DSButtonViewModel.button(fromToken: buttonType)
        }
        
        if let title = model.content?.string(forKey: "text") {
            buttonViewModel.title = title
        }
        
        if let titleColor = model.content?.string(forKey: "titleColor") {
            buttonViewModel.titleColor = DSColorTokens.color(fromToken: titleColor)
        }
        
        if let borderColor = model.content?.string(forKey: "borderColor") {
            buttonViewModel.borderColor = DSColorTokens.color(fromToken: borderColor)
        }
        
        if let backgroundColor = model.content?.string(forKey: "backgroundColor") {
            buttonViewModel.backgroundColor = DSColorTokens.color(fromToken: backgroundColor)
        }
        
        if let backgroundColor = model.content?.string(forKey: "backgroundColor") {
            buttonViewModel.backgroundColor = DSColorTokens.color(fromToken: backgroundColor)
        }
        
        if let cornerRadius = model.content?.string(forKey: "cornerRadius") {
            buttonViewModel.cornerRadius = DSRadiusTokens.radius(fromToken: cornerRadius)
        }
        
        if let contentInsets = model.content?.string(forKey: "contentInsets") {
            buttonViewModel.contentInsets = DSSpacingTokens.spacing(fromToken: contentInsets)
        }
        
        if let font = model.content?.string(forKey: "font") {
            buttonViewModel.font = DSTypographyTokens.font(fromToken: font)
        }
        
        if let borderWidth = model.content?.float(forKey: "borderWidth") {
            buttonViewModel.borderWidth = CGFloat(borderWidth)
        }
        
        let button = DS.button(with: buttonViewModel)
        
        if let action = model.content?.action(forKey: "action") {
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            setAssociatedAction(action, for: button)
        }
        
        return button
    }
    
    private func mapTextField(model: BDUIModel) -> UIView {
        var textFieldViewModel = DSTextFieldViewModel.standard(placeholder: "")
        
        if let textFieldType = model.content?.string(forKey: "textFieldType") {
            textFieldViewModel = DSTextFieldViewModel.textField(fromToken: textFieldType)
        }
        
        if let placeholder = model.content?.string(forKey: "placeholder") {
            textFieldViewModel.placeholder = placeholder
        }
        
        if let textColor = model.content?.string(forKey: "textColor") {
            textFieldViewModel.textColor = DSColorTokens.color(fromToken: textColor)
        }
        
        if let font = model.content?.string(forKey: "font") {
            textFieldViewModel.font = DSTypographyTokens.font(fromToken: font)
        }
        
        if let backgroundColor = model.content?.string(forKey: "backgroundColor") {
            textFieldViewModel.backgroundColor = DSColorTokens.color(fromToken: backgroundColor)
        }
        
        if let cornerRadius = model.content?.string(forKey: "cornerRadius") {
            textFieldViewModel.cornerRadius = DSRadiusTokens.radius(fromToken: cornerRadius)
        }
        
        if let borderWidth = model.content?.float(forKey: "borderWidth") {
            textFieldViewModel.borderWidth = CGFloat(borderWidth)
        }
        
        if let borderColor = model.content?.string(forKey: "borderColor") {
            textFieldViewModel.borderColor = DSColorTokens.color(fromToken: borderColor)
        }
        
        return DS.textField(with: textFieldViewModel)
    }
    
    private func setAssociatedAction(_ action: ActionModel, for object: AnyObject) {
        objc_setAssociatedObject(object, &AssociatedKeys.action, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let action = objc_getAssociatedObject(sender, &AssociatedKeys.action) as? ActionModel else {
            return
        }
        
        handleAction(action)
    }
    
    func handleAction(_ action: ActionModel) {
        switch action.type {
        case .print:
            if let message = action.context?["message"] as? String {
                print("BDUI Action: \(message)")
            }
            
        case .navigate:
            if let destination = action.context?["destination"] as? String {
                delegate?.didRequestNavigation(to: destination, with: action.context)
            }
            
        case .reload:
            delegate?.didRequestReload(with: action.context)
            
        case .dismiss:
            delegate?.didRequestDismiss(with: action.context)
        }
    }
}

private struct AssociatedKeys {
    static var action: UInt8 = 0
}
