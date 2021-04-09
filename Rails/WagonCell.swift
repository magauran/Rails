//
//  WagonCell.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit
import Macaw

final class WagonCell: UICollectionViewCell {
    private let view: WagonView

    override init(frame: CGRect) {
        self.view = WagonView()
        super.init(frame: frame)
        self.contentView.addSubview(self.view)


        self.view.node.nodeBy(tag: "tag1")?.onTouchPressed({ event in
            let shape = event.node as! Shape
            shape.fill = Color.yellow
        })

        self.view.node.nodeBy(tag: "tag1")?.onTouchReleased({ event in
            let shape = event.node as! Shape
            shape.fill = Color.gray
            print("tap node with tag1")
        })

        self.view.node.onLongTap { event in

        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.view.frame = self.bounds
    }
}
