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
        self.updateColor()
        
        self.navigationBar.isTranslucent = false
    }

    func background(isWhite:Bool) {
        if isWhite {
            self.navigationBar.barTintColor = Palette.viewBGColor
            self.navigationBar.backgroundColor = Palette.viewBGColor
        } else {
            self.navigationBar.barTintColor = Palette.greyBackgroundColor
            self.navigationBar.backgroundColor = Palette.greyBackgroundColor
        }
    }
    
    @objc
    private func updateColor() {
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.navigationBar.barTintColor = Palette.viewBGColor
        self.navigationBar.backgroundColor = Palette.viewBGColor
        self.navigationBar.tintColor = Palette.grayishBlackColor
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font :
                                                    Font.semiBold(22),
                                                  NSAttributedString.Key.foregroundColor : Palette.Text.primary]
        
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
    
    public func setNavbarTransculent() {
        self.isNavigationBarHidden = false
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.backgroundColor = UIColor.clear
        self.navigationBar.isTranslucent = true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
