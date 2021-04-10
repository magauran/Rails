//
//  MapHeaderView.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

class MapHeaderView: UIView {
    
    public let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        label.textColor = Palette.textColor
        label.textAlignment = .natural
        label.highlightedTextColor = Palette.grayishBlackColor
        label.numberOfLines = 3
        return label
    }()
    
    public let descLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = Palette.textColor
        label.textAlignment = .natural
        label.highlightedTextColor = Palette.grayishBlackColor
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.titleLabel, self.descLabel])
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(frame: CGRect, title: String? = nil, description: String? = nil) {
        super.init(frame: frame)
        self.titleLabel.text = title
        self.descLabel.text = description
        
        self.setupSubviews()
        self.setupAppearance()
    }
    
    private func setupAppearance() {
        self.backgroundColor = Palette.viewBGColor
    }
    
    private func setupSubviews() {
        self.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            self.descLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            
            // layout constaints
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
