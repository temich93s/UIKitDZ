//
//  UselessViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 01.10.2022.
//

import UIKit

// MARK: - UselessViewController

/// Второй VC для дополнительной вкладки TabBarVC
final class UselessViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods
    
    private func setUI() {
        view.backgroundColor = .lightGray
    }
}
