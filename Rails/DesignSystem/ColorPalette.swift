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

    enum TabBar {
        static let normalIcon = UIColor(rgb: 0xB1B4BF)
        static let selectedIcon = UIColor(rgb: 0x031672)
    }
}
