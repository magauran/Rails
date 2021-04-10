//
//  TicketView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints

final class TicketView: UIView {
    init() {
        self.carLabel = Self.makeCarLabel()
        self.seatLabel = Self.makeSeatLabel()
        self.titleLabel = Self.makeTitleLabel()
        self.timePeriodView = Self.makeTimePeriodView()
        self.progressView = Self.makeProgressView()

        super.init(frame: .zero)
        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowPath = CGPath(
            roundedRect: self.bounds,
            cornerWidth: Style.cornerRadius,
            cornerHeight: Style.cornerRadius,
            transform: nil
        )
    }

    // MARK: - Private
    private enum Style {
        static let cornerRadius: CGFloat = 13.0
    }

    private let carLabel: UILabel
    private let seatLabel: UILabel
    private let titleLabel: UILabel
    private let timePeriodView: TimePeriodView
    private let progressView: UIProgressView

    private func setup() {
        self.setupShadow()
        self.backgroundColor = .white
        self.layer.cornerRadius = Style.cornerRadius
        self.layer.cornerCurve = .continuous

        let topLabels = UIStackView(arrangedSubviews: [
            self.carLabel,
            self.seatLabel,
        ])

        topLabels.axis = .horizontal

        let stackView = UIStackView(arrangedSubviews: [
            topLabels,
            self.titleLabel,
            self.timePeriodView,
            self.progressView,
        ])
        stackView.axis = .vertical
        stackView.spacing = 9

        self.addSubview(stackView)
        stackView.edgesToSuperview(insets: .init(top: 18, left: 24, bottom: 18, right: 24))

        self.clipsToBounds = false
    }

    private func setupShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0.125, green: 0.125, blue: 0.125, alpha: 0.06).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 20
    }

    // MARK: - Factory
    private static func makeCarLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.regular(15)
            $0.color = Palette.Text.primary
            $0.minimumLineHeight = 17
            $0.maximumLineHeight = 17
        }
        label.styledText = "Car 07"
        return label
    }

    private static func makeSeatLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.regular(15)
            $0.color = Palette.Text.primary
            $0.minimumLineHeight = 17
            $0.maximumLineHeight = 17
        }
        label.styledText = "Seat 10"
        return label
    }

    private static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.semiBold(20)
            $0.color = Palette.Text.primary
            $0.minimumLineHeight = 20
            $0.maximumLineHeight = 20
            $0.kerning = .point(-0.71)
        }
        label.styledText = "NAPOLI — AC CORSA SEMPLICE"
        return label
    }

    private static func makeTimePeriodView() -> TimePeriodView {
        let view = TimePeriodView()
        return view
    }

    private static func makeProgressView() -> UIProgressView {
        let view = UIProgressView()
        view.progress = 0.4
        view.progressTintColor = UIColor(rgb: 0x03724A)
        view.trackTintColor = UIColor(rgb: 0xF2F2F3)
        view.height(6)
        return view
    }
}
