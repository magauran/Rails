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

    func highlightUserPlace() {
        guard let userShape = self.view.node.nodeBy(tag: "user") as? Shape else { return }
        userShape.fill = Macaw.Color(rgb: 0x7E8074)
        userShape.opacity = 1

        guard let userTextShape = self.view.node.nodeBy(tag: "user_text") as? Shape else { return }
        userTextShape.fill = Macaw.Color(rgb: 0xFFFFFF)
        self.dimmingView.isHidden = true
    }

    func unhighlightUserPlace() {
        guard let userShape = self.view.node.nodeBy(tag: "user") as? Shape else { return }
        userShape.fill = Macaw.Color(rgb: 0xBDBDC2)
        userShape.opacity = 0.2

        guard let userTextShape = self.view.node.nodeBy(tag: "user_text") as? Shape else { return }
        userTextShape.fill = Macaw.Color(rgb: 0x454C66)
        self.dimmingView.isHidden = false
    }

    private let view: WagonView
    private let userLocationView: UserLocationView
    private let dimmingView: UIView

    override init(frame: CGRect) {
        self.view = WagonView()
        self.userLocationView = UserLocationView()
        self.dimmingView = UIView()

        super.init(frame: frame)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.contentView.addSubview(self.view)
        self.view.edgesToSuperview(insets: .horizontal(50))
        self.contentView.addSubview(self.userLocationView)
        self.contentView.addSubview(self.dimmingView)

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

        self.dimmingView.edgesToSuperview()
        self.dimmingView.backgroundColor = UIColor(rgb: 0x7E8074, alpha: 0.1)
        self.dimmingView.isHidden = true

        let wagonTitle = UILabel()
        wagonTitle.styledText = "02"
        wagonTitle.style = StringStyle {
            $0.font = Font.bold(96)
            $0.color = UIColor(rgb: 0x483434, alpha: 0.2)
        }

        self.dimmingView.addSubview(wagonTitle)
        wagonTitle.centerXToSuperview()
        wagonTitle.top(to: self.dimmingView, offset: 96)
    }
}
