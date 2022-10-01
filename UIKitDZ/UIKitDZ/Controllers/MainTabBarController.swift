//
//  MainTabBarController.swift
//  UIKitDZ
//
//  Created by 2lup on 01.10.2022.
//

import UIKit

/// основной таб бар приложения
final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTabBarAppearance()
    }
    
    private func setTabBar() {
        let exampleLabelViewController = ExampleLabelViewController()
        exampleLabelViewController.tabBarItem.title = "ExampleVC"
        exampleLabelViewController.tabBarItem.image = UIImage(systemName: "cross.fill")
        
        let uselessViewController = UselessViewController()
        uselessViewController.tabBarItem.title = "UselessVC"
        uselessViewController.tabBarItem.image = UIImage(systemName: "heart.circle.fill")
        uselessViewController.tabBarItem.badgeValue = "1"
        uselessViewController.tabBarItem.badgeColor = .blue
        
        let navigationControllerFirst = UINavigationController(rootViewController: exampleLabelViewController)
        let navigationControllerSecond = UINavigationController(rootViewController: uselessViewController)
        
        let mainTabBarController = UITabBarController()
        mainTabBarController.setViewControllers([navigationControllerFirst, navigationControllerSecond], animated: true)
        
        viewControllers = [navigationControllerFirst, navigationControllerSecond]
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        roundLayer.fillColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .black
    }
    
}
