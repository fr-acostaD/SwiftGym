//
//  SceneDelegate.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 30/10/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Crear la ventana y asociarla con la escena
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene

        // Inicializar el controlador de vista principal
        let mainViewController = tabBarInit()

        // Establecer el controlador de vista raíz
        window?.rootViewController = mainViewController
        // Hacer que la ventana sea visible
        window?.makeKeyAndVisible()
    }

    private func setUpPageHome() -> UINavigationController {
        let home = MainViewController()
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        return UINavigationController(rootViewController: home)
    }
    private func setUpPageExplore() -> UINavigationController {
        let explore = ExploreWorkout()
        explore.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)

        return UINavigationController(rootViewController: explore)
    }
    private func setUpPageSignIn() -> UINavigationController {
        let explore = SignInPage()
        explore.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

        return UINavigationController(rootViewController: explore)
    }
    
    private func tabBarInit() -> UITabBarController {
        let explore = setUpPageExplore()
        let home = setUpPageHome()
        let signIn = setUpPageSignIn()
        let tabBar = UITabBarController()


        // Se personaliza la apariencia con la clase UITabBar estatica:
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .systemOrange
        UITabBar.appearance().unselectedItemTintColor = .red
        tabBar.viewControllers = [home, signIn, explore]

        return tabBar
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

