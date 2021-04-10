//
//  UserLocationView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import Pulsator

final class UserLocationView: UIView {
    private let pulsator: Pulsator
    private let circle: UIView

    init() {
        self.pulsator = Pulsator()
        self.circle = UIView()
        super.init(frame: .init(origin: .zero, size: Layout.size))
        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.pulsator.position = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        self.circle.frame = self.bounds
        self.circle.layer.cornerRadius = self.bounds.width / 2
    }

    override var intrinsicContentSize: CGSize {
        Layout.size
    }

    func start() {
        self.pulsator.start()
    }

    func stop() {
        self.pulsator.stop()
    }

    private enum Layout {
        static let size = CGSize(width: 16, height: 16)
    }

    private func setup() {
        self.pulsator.numPulse = 4
        self.pulsator.animationDuration = 5
        self.pulsator.radius = 35
        self.pulsator.backgroundColor = UIColor(rgb: 0x7E8074).withAlphaComponent(0.7).cgColor
        self.layer.addSublayer(self.pulsator)
        self.clipsToBounds = false

        self.addSubview(self.circle)
        self.circle.backgroundColor = UIColor(rgb: 0x7E8074)
    }
}
