//
//  Font.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit

enum Font {
    static func regular(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-Regular", size: size)! }
    static func regularItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-RegularItalic", size: size)! }
    static func thin(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-Thin", size: size)! }
    static func thinItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-UltraLight", size: size)! }
    static func ultraLight(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-ThinItalic", size: size)! }
    static func ultraLightItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-UltraLightItalic", size: size)! }
    static func lightItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-LightItalic", size: size)! }
    static func medium(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-Medium", size: size)! }
    static func mediumItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-MediumItalic", size: size)! }
    static func semiBold(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-SemiBold", size: size)! }
    static func semiBoldItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-SemiBoldItalic", size: size)! }
    static func bold(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-Bold", size: size)! }
    static func boldItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-BoldItalic", size: size)! }
    static func extraBoldItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-ExtraBoldItalic", size: size)! }
    static func black(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-Black", size: size)! }
    static func heavy(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-Heavy", size: size)! }
    static func blackItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-BlackItalic", size: size)! }
    static func heavyItalic(_ size: CGFloat) -> UIFont { return UIFont(name: "Gilroy-HeavyItalic", size: size)! }
}
