//
//  ToiletCell.swift
//  Rails
//
//  Created by Alexey Salangin on 4/10/21.
//

import UIKit
import Macaw

final class ToiletCell: UICollectionViewCell {
    private let view: ToiletView

    override init(frame: CGRect) {
        self.view = ToiletView()

        super.init(frame: frame)

        self.setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.view.frame = self.bounds
    }

    private func setup() {
        self.contentView.addSubview(self.view)
    }
}
