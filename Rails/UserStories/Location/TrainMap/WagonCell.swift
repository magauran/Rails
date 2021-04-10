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
    var userLocation: CGPoint? = nil {
        didSet {
            if let userLocation = self.userLocation {
                self.userLocationView.center = userLocation
                self.userLocationView.isHidden = false
                self.userLocationView.start()
            } else {
                self.userLocationView.isHidden = true
                self.userLocationView.stop()
            }
        }
    }

    private let view: WagonView
    private let userLocationView: UserLocationView

    override init(frame: CGRect) {
        self.view = WagonView()
        self.userLocationView = UserLocationView()

        super.init(frame: frame)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.contentView.addSubview(self.view)
        self.view.edgesToSuperview(insets: .horizontal(16))
        self.contentView.addSubview(self.userLocationView)

        self.userLocationView.isHidden = true

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
}
