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

        let viewController = TrainMapViewController()

        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "feed"), tag: 0)

        let notificationsViewController = NotificationsViewController()
        notificationsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "notify"), tag: 0)

        let locationViewController = StationMapViewController()
        locationViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "location"), tag: 0)

        let userViewController = UserViewController()
        userViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "heart-rate"), tag: 0)

        let viewControllers: [UIViewController] = [
            mainViewController,
            notificationsViewController,
            locationViewController,
            userViewController,
        ]

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers

        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        setTabBarItemColors(appearance.stackedLayoutAppearance)
        setTabBarItemColors(appearance.inlineLayoutAppearance)
        setTabBarItemColors(appearance.compactInlineLayoutAppearance)

        tabBarController.tabBar.standardAppearance = appearance

        window.rootViewController = tabBarController

        self.window = window
        window.makeKeyAndVisible()
    }

    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = Palette.TabBar.normalIcon
        itemAppearance.selected.iconColor = Palette.TabBar.selectedIcon
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
