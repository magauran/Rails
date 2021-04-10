//
//  SceneDelegate.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

//        let viewController = TrainMapViewController()

        window.rootViewController = TabBarViewController()

        self.window = window
        window.makeKeyAndVisible()
    }

}
