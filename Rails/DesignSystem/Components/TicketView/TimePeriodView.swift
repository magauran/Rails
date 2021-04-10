//
//  TimePeriodView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints

final class TimePeriodView: UIView {
    init() {
        self.fromDateTimeView = DateTimeView()
        self.toDateTimeView = DateTimeView()
        self.arrowView = Self.makeArrowView()

        super.init(frame: .zero)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private let fromDateTimeView: DateTimeView
    private let toDateTimeView: DateTimeView
    private let arrowView: UIImageView

    private func setup() {
        let contentStackView = UIStackView()
        contentStackView.axis = .horizontal
        contentStackView.spacing = 9

        contentStackView.addArrangedSubview(self.fromDateTimeView)
        contentStackView.addArrangedSubview(self.arrowView)
        contentStackView.addArrangedSubview(self.toDateTimeView)

        self.addSubview(contentStackView)

        contentStackView.edgesToSuperview(excluding: .right)

        self.fromDateTimeView.configure(viewModel: .init(date: "10 April", time: "15:16"))
        self.toDateTimeView.configure(viewModel: .init(date: "10 April", time: "17:10"))
    }

    private static func makeArrowView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ticket-arrow")
        return imageView
    }
}
