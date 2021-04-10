//
//  ForwardDateView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints

final class ForwardDateView: UIView {
    init() {
        self.titleLabel = Self.makeTitleLabel()
        self.dayLabel = Self.makeDayLabel()
        self.monthLabel = Self.makeMonthLabel()
        self.dayOfWeekLabel = Self.makeDayOfWeekLabel()

        super.init(frame: .zero)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private let titleLabel: UILabel
    private let monthLabel: UILabel
    private let dayOfWeekLabel: UILabel
    private let dayLabel: UILabel

    private func setup() {
        let bottomRightStackView = UIStackView(arrangedSubviews: [
            self.monthLabel,
            self.dayOfWeekLabel,
        ])
        bottomRightStackView.axis = .vertical
        bottomRightStackView.distribution = .fillEqually

        let bottomStackView = UIStackView(arrangedSubviews: [
            self.dayLabel.wrapped(with: .init(top: 4, left: 0, bottom: 0, right: 0)),
            bottomRightStackView.wrapped(with: .init(top: 0, left: 0, bottom: 4, right: 0)),
        ])
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 8

        let contentStackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            bottomStackView,
        ])
        contentStackView.axis = .vertical
        contentStackView.spacing = 2
        self.addSubview(contentStackView)
        contentStackView.edgesToSuperview()
    }

    private static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.styledText = "Forward"
        label.style = StringStyle {
            $0.font = Font.regular(12)
            $0.minimumLineHeight = 14
            $0.maximumLineHeight = 14
            $0.color = Palette.Text.placeholder
        }
        return label
    }

    private static func makeMonthLabel() -> UILabel {
        let label = UILabel()
        label.styledText = "APR"
        label.style = StringStyle {
            $0.font = Font.regular(12)
            $0.minimumLineHeight = 14
            $0.maximumLineHeight = 14
            $0.color = Palette.Text.primary
        }
        return label
    }

    private static func makeDayLabel() -> UILabel {
        let label = VerticalAlignmentLabel()
        label.verticalTextAlignment = .bottom
        label.styledText = "10"
        label.style = StringStyle {
            $0.font = Font.semiBold(28)
            $0.minimumLineHeight = 27
            $0.maximumLineHeight = 27
            $0.color = Palette.Text.primary
        }
        return label
    }

    private static func makeDayOfWeekLabel() -> UILabel {
        let label = UILabel()
        label.styledText = "Sat"
        label.style = StringStyle {
            $0.font = Font.regular(12)
            $0.minimumLineHeight = 14
            $0.maximumLineHeight = 14
            $0.color = Palette.Text.placeholder
        }
        return label
    }
}

extension UIView {
    fileprivate func wrapped(with insets: UIEdgeInsets) -> UIView {
        let view = UIView()
        view.addSubview(self)
        self.edgesToSuperview(insets: insets)
        return view
    }
}
