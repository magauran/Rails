//
//  WagonCell.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit
import Macaw

final class WagonCell: UICollectionViewCell {
    struct Actions {
        var didTap: ((CGPoint) -> Void)?
    }

    var actions = Actions()
    private let view: WagonView

    override init(frame: CGRect) {
        self.view = WagonView()
        super.init(frame: frame)
        self.contentView.addSubview(self.view)


        self.view.node.nodeBy(tag: "tag1")?.onTouchPressed { event in
            let shape = event.node as! Shape
            shape.fill = Color.yellow
        }

        self.view.node.nodeBy(tag: "tag1")?.onTouchReleased { [weak self] event in
            guard let self = self,
                  let shape = event.node as? Shape,
                  let touchPoint = event.points.first
            else { return }
            shape.fill = MacawPalette.someColor

            let point = touchPoint.location(in: .scene).toCG()

            if !event.isCancelled {
                self.actions.didTap?(point)
                print("tap")
            }
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
