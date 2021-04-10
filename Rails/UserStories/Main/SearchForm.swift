//
//  SearchForm.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints
import SkyFloatingLabelTextField

final class SearchForm: UIView {
    init() {
        self.titleLabel = Self.makeTitleLabel()
        self.fromTextField = Self.makeFromTextField()
        self.toTextField = Self.makeToTextField()
        self.forwardDateView = ForwardDateView()
        self.searchButton = Self.makeSearchButton()

        super.init(frame: .zero)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private let titleLabel: UILabel
    private let fromTextField: SkyFloatingLabelTextField
    private let toTextField: SkyFloatingLabelTextField
    private let forwardDateView: ForwardDateView
    private let searchButton: UIButton

    private func setup() {
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 20

        contentStackView.addArrangedSubview(self.titleLabel)
        contentStackView.addArrangedSubview(self.fromTextField)
        contentStackView.addArrangedSubview(self.toTextField)

        let footerStackView = UIStackView(arrangedSubviews: [
            self.forwardDateView,
            self.searchButton,
        ])
        footerStackView.axis = .horizontal
        footerStackView.spacing = 24
        contentStackView.addArrangedSubview(footerStackView)

        self.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .uniform(24))
    }

    private static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.semiBold(20)
            $0.minimumLineHeight = 30
            $0.maximumLineHeight = 30
        }
        label.styledText = "Plan your trip"
        return label
    }

    private static func makeFromTextField() -> SkyFloatingLabelTextField {
        Self.makeTextField(text: "From")
    }

    private static func makeToTextField() -> SkyFloatingLabelTextField {
        Self.makeTextField(text: "To")
    }

    private static func makeTextField(text: String) -> SkyFloatingLabelTextField {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = text
        textField.lineColor = Palette.TextField.lineColor
        textField.selectedLineColor = Palette.TextField.selectedLineColor
        textField.lineHeight = 2
        textField.placeholderColor = Palette.Text.placeholder
        textField.placeholderFont = Font.regular(15)
        textField.selectedTitleColor = Palette.TextField.selectedTitleColor
        textField.titleFormatter = { $0 }
        textField.titleFont = Font.regular(15)
        let imageView = UIImageView(image: UIImage(named: "text-field-location"))
        imageView.size(.init(width: 16, height: 16))
        textField.rightView = imageView
        textField.rightViewMode = .always
        return textField
    }

    private static func makeSearchButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        let backgroundImage = Palette.Button.primary.image()
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.titleLabel?.font = Font.semiBold(13)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.layer.cornerCurve = .continuous
        return button
    }
}
