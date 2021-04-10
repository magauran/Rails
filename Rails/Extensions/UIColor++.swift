//
//  UIColor++.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt32, alpha: CGFloat = 1) {
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255
        let blue = CGFloat(rgb & 0x0000FF) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    func image() -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }

        let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))

        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        context.setFillColor(self.cgColor)
        context.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}
