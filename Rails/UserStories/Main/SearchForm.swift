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
    var textFields: [UITextField] {
        [self.fromTextField, self.toTextField]
    }

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

    private let titleLabel: UILabel
    private let fromTextField: SkyFloatingLabelTextField
    private let toTextField: SkyFloatingLabelTextField
    private let forwardDateView: ForwardDateView
    private let searchButton: UIButton

    private func setup() {
        self.setupShadow()
        self.layer.cornerRadius = Style.cornerRadius
        self.layer.cornerCurve = .continuous
        self.backgroundColor = .white

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 20

        contentStackView.addArrangedSubview(self.titleLabel)
        contentStackView.addArrangedSubview(self.fromTextField)
        contentStackView.addArrangedSubview(self.toTextField)
        contentStackView.setCustomSpacing(30, after: self.toTextField)

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

    private func setupShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0.125, green: 0.125, blue: 0.125, alpha: 0.06).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 20
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
        let placeholderStyle = StringStyle {
            $0.color = Palette.Text.placeholder
            $0.font = Font.regular(15)
        }
        textField.attributedPlaceholder = text.set(style: placeholderStyle)
        textField.lineColor = Palette.TextField.lineColor
        textField.selectedLineColor = Palette.TextField.selectedLineColor
        textField.lineHeight = 2
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
        button.titleLabel?.font = Font.semiBold(16)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.layer.cornerCurve = .continuous
        return button
    }
}
