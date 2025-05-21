//
//  BDUIViewController.swift
//  Lab2
//
//  Created by Vladislav Shiptenko on 21.05.2025.
//

import UIKit

class BDUIView: UIViewController, BDUIMapperDelegate {
    private let configuration: BDUIScreenConfiguration
    private let mapper: BDUIMapper
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    private var currentContext: [String: Any]?
    
    init(configuration: BDUIScreenConfiguration, mapper: BDUIMapper) {
        self.configuration = configuration
        self.mapper = mapper
        super.init(nibName: nil, bundle: nil)
        self.title = configuration.title
        self.mapper.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData()
    }
    
    func didRequestNavigation(to destination: String, with context: [String: Any]?) {
        if let endpoint = context?["endpoint"] as? String {
            let title = context?["title"] as? String
            
            let newConfig = BDUIScreenConfiguration(
                endpoint: endpoint,
                title: title
            )
            
            let newBDUIVC = BDUIView(configuration: newConfig, mapper: mapper)
            navigationController?.pushViewController(newBDUIVC, animated: true)
        } else {
            print("Запрос на навигацию к: \(destination) с контекстом: \(String(describing: context))")
        }
    }
    
    func didRequestReload(with context: [String: Any]?) {
        currentContext = context
        loadData()
    }
    
    func didRequestDismiss(with context: [String: Any]?) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.hidesWhenStopped = true
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func loadData() {
        loadingIndicator.startAnimating()
        scrollView.isHidden = true
        guard let url = URL(string: configuration.endpoint) else {
            print("URL error")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = configuration.httpMethod
        request.httpBody = configuration.body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.loadingIndicator.stopAnimating()
                
                if let error = error {
                    self?.showError(error.localizedDescription)
                    return
                }
                
                guard let data = data else {
                    self?.showError("Данные не получены")
                    return
                }
                print(String(data: data, encoding: .utf8) ?? "")
                
                do {
                    guard let model = try? JSONDecoder().decode(BDUIModelPostman.self, from: data) else {
                        self?.showError("Не удалось распарсить JSON")
                        return
                    }
                    if let view = self?.mapper.map(model: model.json) {
                        self?.displayView(view)
                    } else {
                        self?.showError("Не удалось преобразовать данные в представление")
                    }
                }
            }
        }.resume()
    }
    
    private func displayView(_ view: UIView) {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        scrollView.isHidden = false
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
