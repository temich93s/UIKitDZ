//
//  StackViewViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 15.10.2022.
//

import UIKit

// MARK: - Cветофор через стеквью - кодом

final class StackViewViewController: UIViewController {

    // MARK: - Private Visual Properties
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.preservesSuperviewLayoutMargins = true
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods
    
    private func setupUI() {
        mainStackView.addArrangedSubview(redView)
        mainStackView.addArrangedSubview(yellowView)
        mainStackView.addArrangedSubview(greenView)
        view.addSubview(mainStackView)
        createConstraint()
    }
    
    private func createConstraint() {
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
