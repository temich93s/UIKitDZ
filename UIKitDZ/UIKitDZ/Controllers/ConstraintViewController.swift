//
//  ConstraintViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 15.10.2022.
//

import UIKit

// MARK: - Cветофор через констрейнты - кодом

final class ConstraintViewController: UIViewController {

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
    
    private func createRedViewConstraint() {
        NSLayoutConstraint(
            item: redView, attribute: .top, relatedBy: .equal,
            toItem: view, attribute: .topMargin, multiplier: 1, constant: 30
        ).isActive = true
        
        NSLayoutConstraint(
            item: redView, attribute: .height, relatedBy: .equal,
            toItem: yellowView, attribute: .height, multiplier: 1, constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: redView, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: redView, attribute: .height, relatedBy: .equal,
            toItem: redView, attribute: .width, multiplier: 1.0 / 1.0, constant: 0
        ).isActive = true
    }
    
    private func createYellowViewConstraint() {
        NSLayoutConstraint(
            item: yellowView, attribute: .top, relatedBy: .equal,
            toItem: redView, attribute: .bottom, multiplier: 1, constant: 10
        ).isActive = true
        
        NSLayoutConstraint(
            item: yellowView, attribute: .height, relatedBy: .equal,
            toItem: greenView, attribute: .height, multiplier: 1, constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: yellowView, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: yellowView, attribute: .height, relatedBy: .equal,
            toItem: yellowView, attribute: .width, multiplier: 1.0 / 1.0, constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: yellowView, attribute: .bottom, relatedBy: .equal,
            toItem: greenView, attribute: .top, multiplier: 1, constant: -10
        ).isActive = true
    }
    
    private func createGreenViewConstraint() {
        NSLayoutConstraint(
            item: greenView, attribute: .bottom, relatedBy: .equal,
            toItem: view, attribute: .bottomMargin, multiplier: 1, constant: -30
        ).isActive = true
        
        NSLayoutConstraint(
            item: greenView, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: greenView, attribute: .height, relatedBy: .equal,
            toItem: greenView, attribute: .width, multiplier: 1.0 / 1.0, constant: 0
        ).isActive = true
    }
    
    private func createBlackViewConstraint() {
        NSLayoutConstraint(
            item: blackView, attribute: .top, relatedBy: .equal,
            toItem: redView, attribute: .top, multiplier: 1, constant: -10
        ).isActive = true
        
        NSLayoutConstraint(
            item: blackView, attribute: .bottom, relatedBy: .equal,
            toItem: greenView, attribute: .bottom, multiplier: 1, constant: 10
        ).isActive = true
        
        NSLayoutConstraint(
            item: blackView, attribute: .leading, relatedBy: .equal,
            toItem: yellowView, attribute: .leading, multiplier: 1, constant: -10
        ).isActive = true
        
        NSLayoutConstraint(
            item: blackView, attribute: .trailing, relatedBy: .equal,
            toItem: yellowView, attribute: .trailing, multiplier: 1, constant: 10
        ).isActive = true
    }
    
}
