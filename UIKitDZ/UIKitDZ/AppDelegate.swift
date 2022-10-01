//
//  AppDelegate.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // используется перенос строки когда более 2 входных параметров у функции
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // Надо было добавить Set в конце у sceneSessions
    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessionsSet: Set<UISceneSession>
    ) { }
}
