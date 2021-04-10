//
//  DateTimeView.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints

final class DateTimeView: UIView {
    struct ViewModel {
        let date: String
        let time: String
    }

    init() {
        self.dateLabel = Self.makeDateLabel()
        self.timeLabel = Self.makeTimeLabel()

        super.init(frame: .zero)

        self.addSubview(self.dateLabel)
        self.addSubview(self.timeLabel)

        self.dateLabel.edgesToSuperview(excluding: .bottom)
        self.timeLabel.edgesToSuperview(excluding: .top)
        self.timeLabel.topToBottom(of: self.dateLabel, offset: 2)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: ViewModel) {
        self.dateLabel.styledText = viewModel.date
        self.timeLabel.styledText = viewModel.time
    }

    // MARK: - Private
    private let dateLabel: UILabel
    private let timeLabel: UILabel

    private static func makeDateLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.regular(12)
            $0.color = Palette.Text.placeholder
            $0.minimumLineHeight = 12
            $0.maximumLineHeight = 12
        }
        label.styledText = ""
        return label
    }

    private static func makeTimeLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.medium(20)
            $0.color = Palette.Text.primary
            $0.minimumLineHeight = 20
            $0.maximumLineHeight = 20
        }
        label.styledText = ""
        return label
    }
}
