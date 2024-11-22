//
//  TabBarAppearanceConfig.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 22/11/24.
//
import UIKit

// MARK: - TabBarAppearanceConfig

struct TabBarAppearanceConfig {
    static func applyGlobalAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .black
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .systemOrange
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .red
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.red]

        // Aplicar configuración global
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
