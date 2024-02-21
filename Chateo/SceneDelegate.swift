//
//  SceneDelegate.swift
//  Chateo
//
//  Created by Daniil Rassadin on 19/2/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
//        let navigationController = UINavigationController(rootViewController: WelcomeVC())
        let navigationController = UINavigationController(rootViewController: TabBarController())
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.standardAppearance.titleTextAttributes = [
            .font: UIFont(name: "MulishRoman-SemiBold", size: 18) ?? .systemFont(ofSize: 18)
        ]
        navigationController.navigationBar.standardAppearance.titlePositionAdjustment = .init(
            horizontal: -CGFloat.greatestFiniteMagnitude,
            vertical: 0
        )
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

