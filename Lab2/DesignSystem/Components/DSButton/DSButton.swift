import UIKit

public final class DSButton: UIButton {
    public typealias ActionHandler = () -> Void
    
    private var viewModel: DSButtonViewModel
    private var actionHandler: ActionHandler?
    
    public init(viewModel: DSButtonViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(with viewModel: DSButtonViewModel) {
        self.viewModel = viewModel
        setupButton()
    }
    
    public func setActionHandler(_ handler: @escaping ActionHandler) {
        actionHandler = handler
    }
    
    private func setupButton() {
        setTitle(viewModel.title, for: .normal)
        titleLabel?.font = viewModel.font
        setTitleColor(viewModel.titleColor, for: .normal)
        backgroundColor = viewModel.backgroundColor
        layer.cornerRadius = viewModel.cornerRadius
        
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(
            top: viewModel.contentInsets,
            leading: viewModel.contentInsets,
            bottom: viewModel.contentInsets,
            trailing: viewModel.contentInsets
        )
        
        config.buttonSize = viewModel.buttonSize
        
        layer.borderWidth = viewModel.borderWidth
        layer.borderColor = viewModel.borderColor?.cgColor
        
        removeTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        actionHandler?()
    }
}
