//
//  ContainerWrapper.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

final class ContainerWrapper: NSObject {
    
    // here you can add some options and customization for every single instance
    static func wrapInNavigationController(with rootViewController: UIViewController) -> NavigationViewController {
        return NavigationViewController(rootViewController: rootViewController)
    }
    
}
