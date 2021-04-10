//
//  InTrainViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import TinyConstraints
import PanModal

final class InTrainViewController: UIViewController {
    var onConfirm: (() -> Void)?
    var onDismiss: (() -> Void)?

    init() {
        self.titleLabel = Self.makeTitleLabel()
        self.descriptionLabel = Self.makeDescriptionLabel()
        self.confirmButton = Self.makeConfirmButton()
        self.dismissButton = Self.makeDismissButton()

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Private
    private let titleLabel: UILabel
    private let descriptionLabel: UILabel
    private let confirmButton: UIButton
    private let dismissButton: UIButton

    private func setup() {
        self.view.backgroundColor = .white

        let containerStackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            self.descriptionLabel,
            self.confirmButton,
            self.dismissButton,
        ])
        containerStackView.axis = .vertical

        self.view.addSubview(containerStackView)
        containerStackView.edgesToSuperview(insets: .init(top: 28, left: 24, bottom: 32, right: 24))
        containerStackView.spacing = 16
        containerStackView.setCustomSpacing(0, after: self.titleLabel)

        self.confirmButton.height(44)
        self.dismissButton.height(20)

        self.confirmButton.addTarget(self, action: #selector(self.didTapConfirmButton), for: .touchUpInside)
        self.dismissButton.addTarget(self, action: #selector(self.didTapDismissButton), for: .touchUpInside)
    }

    @objc
    private func didTapConfirmButton() {
        self.onConfirm?()
    }

    @objc
    private func didTapDismissButton() {
        self.onDismiss?()
    }

    private static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.semiBold(24)
            $0.color = Palette.Text.primary
            $0.alignment = .center
            $0.minimumLineHeight = 29
            $0.maximumLineHeight = 29
        }
        label.styledText = "You're on the train"
        label.height(29)
        return label
    }

    private static func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.style = StringStyle {
            $0.font = Font.medium(16)
            $0.color = Palette.Text.placeholder
            $0.alignment = .center
        }
        label.styledText = "While on the train, you can use an interactive map that will help you find your seat, check the status of the toilet, and take advantage of additional services."
        label.numberOfLines = 0
        return label
    }

    private static func makeConfirmButton() -> UIButton {
        let button = UIButton()
        let backgroundImage = Palette.Button.primary.image()
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.setTitle("Open train map", for: .normal)
        button.titleLabel?.font = Font.semiBold(16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.cornerCurve = .continuous
        button.layer.masksToBounds = true
        return button
    }

    private static func makeDismissButton() -> UIButton {
        let button = UIButton(type: .system)
        let backgroundImage = Palette.Button.secondary.image()
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.setTitle("No, thanks", for: .normal)
        button.titleLabel?.font = Font.semiBold(16)
        button.setTitleColor(Palette.Button.secondaryLabel, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.cornerCurve = .continuous
        button.layer.masksToBounds = true
        return button
    }
}

extension InTrainViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        nil
    }

    var longFormHeight: PanModalHeight {
        .intrinsicHeight
    }

    var cornerRadius: CGFloat {
        16.0
    }

    var panModalBackgroundColor: UIColor {
        UIColor(rgb: 0x655959).withAlphaComponent(0.9)
    }
}
