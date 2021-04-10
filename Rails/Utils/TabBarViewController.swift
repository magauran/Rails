//
//  TabBarViewController.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var mainViewController: NavigationViewController!
    var notificationsViewController: NavigationViewController!
    var locationViewController: NavigationViewController!
    var userViewController: NavigationViewController!
    
    var lastViewController:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.setupViewControllers()
        self.setupAppearance()
        
        self.lastViewController = self.mainViewController
        
    }
    
    private func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        self.setTabBarItemColors(appearance.stackedLayoutAppearance)
        self.setTabBarItemColors(appearance.inlineLayoutAppearance)
        self.setTabBarItemColors(appearance.compactInlineLayoutAppearance)
        
        self.tabBar.standardAppearance = appearance
    }
    
    private func setupViewControllers() {
        self.mainViewController = ContainerWrapper.wrapInNavigationController(with: MainViewController())
        self.mainViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "feed"), tag: 0)
        
        self.notificationsViewController = ContainerWrapper.wrapInNavigationController(with: NotificationsViewController())
        self.notificationsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "notify"), tag: 0)
        
        self.locationViewController = ContainerWrapper.wrapInNavigationController(with: StationMapViewController())
        self.locationViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "location"), tag: 0)
        
        self.userViewController = ContainerWrapper.wrapInNavigationController(with: UserViewController())
        self.userViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "heart-rate"), tag: 0)
        
        self.viewControllers = [self.mainViewController,
                                self.notificationsViewController,
                                self.locationViewController,
                                self.userViewController]
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = Palette.TabBar.normalIcon
        itemAppearance.selected.iconColor = Palette.TabBar.selectedIcon
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        self.lastViewController = viewController
    }
}

