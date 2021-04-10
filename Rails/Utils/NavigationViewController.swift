//
//  NavigationViewController.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

final class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false
    }

    static func setupAppearance() {
        let backImage = UIImage(named: "arrow-icon")

        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.clear
        ]
        appearance.titleTextAttributes = [NSAttributedString.Key.font :
                                            Font.semiBold(20),
                                          NSAttributedString.Key.foregroundColor : Palette.Text.primary]
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = Palette.viewBGColor
        appearance.shadowColor = nil

        UINavigationBar.appearance().tintColor = Palette.NavigationBar.tint
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        self.tabBarController?.tabBar.isHidden = false
        return super.popToRootViewController(animated: animated)
    }
}
