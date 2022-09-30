//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 30.09.2022.
//

import UIKit

/// SecondViewController
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SecondVC"
        view.backgroundColor = .green
        
        var tabBarItem2 = UITabBarItem()
        tabBarItem2 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        tabBarItem = tabBarItem2
    }

}
