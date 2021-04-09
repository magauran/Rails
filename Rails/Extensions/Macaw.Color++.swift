//
//  Macaw.Color++.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import Macaw

extension Macaw.Color {
    convenience init(rgb: UInt32, alpha: CGFloat = 1) {
        let red = Int((rgb & 0xFF0000) >> 16)
        let green = Int((rgb & 0x00FF00) >> 8)
        let blue = Int(rgb & 0x0000FF)
        let color = Macaw.Color.rgba(r: red, g: green, b: blue, a: Double(alpha))
        self.init(color.val)
    }
}
