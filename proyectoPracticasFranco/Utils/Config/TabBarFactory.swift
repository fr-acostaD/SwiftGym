//
//  TabBarFactory.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 22/11/24.
//

import UIKit

// MARK: - TabBarFactory
struct TabBarFactory {
    static func createTabBarController() -> UITabBarController {
        let home = createPageHome()
        let signIn = createPageSignIn()
        let signUp = createPageSignUp()
        let tabBar = UITabBarController()
        tabBar.viewControllers = [signUp,home, signIn]
        return tabBar
    }

    private static func createPageHome() -> UINavigationController {
        let home = MainViewController()
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        return UINavigationController(rootViewController: home)
    }

    private static func createPageSignIn() -> UINavigationController {
        let signIn = SignInPage()
        signIn.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        return UINavigationController(rootViewController: signIn)
    }
    
    private static func createPageSignUp() -> UINavigationController {
        let signUp = SignUpPage()
        signUp.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        return UINavigationController(rootViewController: signUp)
    }
}
