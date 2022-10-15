//
//  AnchorViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 15.10.2022.
//

import UIKit

/// светофор через якоря - кодом
final class AnchorViewController: UIViewController {

    // MARK: - Private Visual Properties
    
    private let blackView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        createRedViewConstraint()
        createYellowViewConstraint()
        createGreenViewConstraint()
        createBlackViewConstraint()
    }
    
    // MARK: - Private Constraint Methods
    
    private func createRedViewConstraint() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor),
            redView.widthAnchor.constraint(equalTo: redView.heightAnchor)
        ])
    }
    
    private func createYellowViewConstraint() {
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10),
            yellowView.bottomAnchor.constraint(equalTo: greenView.topAnchor, constant: -10),
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.heightAnchor.constraint(equalTo: greenView.heightAnchor),
            yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor)
        ])
    }
    
    private func createGreenViewConstraint() {
        NSLayoutConstraint.activate([
            greenView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -30),
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.widthAnchor.constraint(equalTo: greenView.heightAnchor)
        ])
    }
    
    private func createBlackViewConstraint() {
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10),
            blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10),
            blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10),
            blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10)
        ])
    }
    
}
