//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController = UINavigationController()
    var navigationControllerTwo = UINavigationController()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let loginViewController = LoginViewController()
        let foodViewController = FoodViewController()
        navigationController = UINavigationController(rootViewController: loginViewController)
        navigationControllerTwo = UINavigationController(rootViewController: foodViewController)
        window?.rootViewController = navigationController
        window?.backgroundColor = UIColor.white
    }
}
