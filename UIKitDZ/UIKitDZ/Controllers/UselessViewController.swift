//
//  UselessViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 01.10.2022.
//

import UIKit

/// Второй VC для дополнительной вкладки TabBarVC
final class UselessViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI() {
        view.backgroundColor = .lightGray
    }
}
