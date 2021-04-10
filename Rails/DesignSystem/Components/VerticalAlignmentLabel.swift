//
//  VerticalAlignmentLabel.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit

class VerticalAlignmentLabel: UILabel {
    var top: Bool = false {
        didSet {
            self.verticalTextAlignment = top ? .top : .center
        }
    }

    var bottom: Bool = false {
        didSet {
            self.verticalTextAlignment = bottom ? .bottom : .center
        }
    }

    var verticalTextAlignment: VerticalTextAlignment = .center {
        didSet {
            self.setNeedsDisplay()
        }
    }

    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: actualRect)
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        switch self.verticalTextAlignment {
        case .top:
            textRect.origin.y = bounds.origin.y
        case .bottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) * 0.5
            break
        }
        return textRect
    }

    enum VerticalTextAlignment {
        case top
        case center
        case bottom
    }
}
