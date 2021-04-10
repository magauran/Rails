//
//  SearchFloatingView.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

class SearchFloatingView: UIView {

    public let textField: UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.backgroundColor = UIColor.clear
        textField.font = Font.bold(14)
        textField.tintColor = Palette.TextField.lineColor
        textField.textColor = Palette.Text.primary
        return textField
    }()
    
    init(frame: CGRect, placeholder: String? = nil) {
        super.init(frame: frame)
        
        if let placeholder = placeholder {
            self.textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                NSAttributedString.Key.foregroundColor: Palette.Text.placeholder,
                NSAttributedString.Key.font: Font.bold(14)
            ])
        }
        
        self.setupViews()
    }
    
    // гавнокод :/
    private func setupViews() {
        let leftView = UIView(frame: CGRect.zero)
        leftView.backgroundColor = .clear
        leftView.translatesAutoresizingMaskIntoConstraints = false
        
        let leftImageView = UIImageView(image: UIImage(named: "search")?
                                            .withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.tintColor = Palette.Text.primary
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        leftView.addSubview(leftImageView)
        
        NSLayoutConstraint.activate([
            leftImageView.heightAnchor.constraint(equalToConstant: 15),
            leftImageView.widthAnchor.constraint(equalToConstant: 15),
            
            leftImageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            leftImageView.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            
            leftView.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        let rightView = UIView(frame: CGRect.zero)
        rightView.backgroundColor = .clear
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        let rightImageView = UIImageView(image: UIImage(named: "geo")?
                                            .withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        rightImageView.contentMode = .scaleAspectFit
        rightImageView.tintColor = Palette.Text.placeholder
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        rightView.addSubview(rightImageView)
        
        NSLayoutConstraint.activate([
            rightImageView.heightAnchor.constraint(equalToConstant: 15),
            rightImageView.widthAnchor.constraint(equalToConstant: 15),
            
            rightImageView.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            rightImageView.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            
            rightView.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        let stackView = UIStackView(arrangedSubviews: [leftView, self.textField, rightView])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        self.backgroundColor = Palette.viewBGColor.color
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = false
        self.layer.cornerRadius = 10
        self.layer.shadowColor = Palette.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
