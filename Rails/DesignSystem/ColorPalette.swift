//
//  ColorPalette.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import Foundation
import Macaw

enum MacawPalette {
    static let someColor = Macaw.Color(rgb: 0xFF0000, alpha: 0.8)
}

enum Palette {
    static let someColor = UIColor(rgb: 0x001188, alpha: 0.8)
    static let textColor = UIColor(rgb: 0x3E3E3E)
    static let viewBGColor = UIColor(rgb: 0xFFFFFF)
    static let grayishBlackColor = UIColor(rgb: 0x383838)
    static let greyBackgroundColor = UIColor(rgb:0xF5F5F5)

    enum NavigationBar {
        static let tint = UIColor(rgb: 0x483434)
    }

    enum Text {
        static let primary = UIColor(rgb: 0x454C66)
        static let placeholder = UIColor(rgb: 0xB5B7C2)
    }

    enum TabBar {
        static let normalIcon = UIColor(rgb: 0xB1B4BF)
        static let selectedIcon = UIColor(rgb: 0x031672)
    }

    enum TextField {
        static let lineColor = UIColor(rgb: 0xB5B7C2)
        static let selectedTitleColor = UIColor(rgb: 0x031672)
        static let selectedLineColor = UIColor(rgb: 0x031672)
    }

    enum Button {
        static let primary = UIColor(rgb: 0xC00733)
        static let secondary = UIColor(rgb: 0xFFFFFF)
        static let secondaryLabel = UIColor(rgb: 0xC00733)
    }
}
