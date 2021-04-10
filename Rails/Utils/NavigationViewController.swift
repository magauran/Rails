//
//  NavigationViewController.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateColor()
        
        self.navigationBar.isTranslucent = false
    }

    func background(isWhite:Bool) {
        if isWhite {
            self.navigationBar.barTintColor = AppColors.viewBackgroundColor.color
            self.navigationBar.backgroundColor = AppColors.viewBackgroundColor.color
        } else {
            self.navigationBar.barTintColor = AppColors.greyBackgroundColor.color
            self.navigationBar.backgroundColor = AppColors.greyBackgroundColor.color
        }
    }
    
    @objc
    private func updateColor() {
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.navigationBar.barTintColor = AppColors.viewBackgroundColor.color
        self.navigationBar.backgroundColor = AppColors.viewBackgroundColor.color
        self.navigationBar.tintColor = AppColors.grayishBlackColor.color
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font :
                                                    UIFont.systemFont(ofSize: 22,
                                                                      weight: UIFont.Weight.medium),
                                             NSAttributedString.Key.foregroundColor : UIColor(rgb: 0x383838)]
        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        self.tabBarController?.tabBar.isHidden = false
        return super.popToRootViewController(animated: animated)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
