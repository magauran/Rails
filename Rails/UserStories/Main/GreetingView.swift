//
//  GreetingView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints

final class GreetingView: UIView {
    init() {
        self.helloLabel = Self.makeHelloLabel()
        self.nameLabel = Self.makeNameLabel()

        super.init(frame: .zero)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private let helloLabel: UILabel
    private let nameLabel: UILabel

    private func setup() {
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical

        contentStackView.addArrangedSubview(self.helloLabel)
        contentStackView.addArrangedSubview(self.nameLabel)

        self.addSubview(contentStackView)

        contentStackView.edgesToSuperview(excluding: .right)
    }

    private static func makeHelloLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.semiBold(20)
            $0.minimumLineHeight = 30
            $0.maximumLineHeight = 30
        }
        label.styledText = "Hello,"
        return label
    }

    private static func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.semiBold(48)
            $0.minimumLineHeight = 64
            $0.maximumLineHeight = 64
        }
        label.styledText = "Antonio"
        return label
    }
}
