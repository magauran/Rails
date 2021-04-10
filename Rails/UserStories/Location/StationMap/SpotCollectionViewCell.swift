//
//  SpotCollectionViewCell.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit

protocol SpotCVCDelegate: AnyObject {
    func didCloseButtonPress()
    func didSelectMainViewPressed(_ cell: SpotCollectionViewCell)
}

class SpotCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.hidesWhenStopped = true
        indicator.color = UIColor.white
        return indicator
    }()
    
    var data: Spot? {
        didSet {
            if let data = self.data {
                self.titleLabel.text = data.title
                self.detailsLabel.text = data.distance
                self.logoImageView.image = UIImage(named: data.image)
            }
        }
    }
    
    weak var delegate: SpotCVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = Font.semiBold(18)
        self.detailsLabel.font = Font.medium(14)
        self.titleLabel.minimumScaleFactor = 0.75
        self.detailsLabel.minimumScaleFactor = 0.75
        self.mainView.layer.cornerRadius = 16
        self.logoImageView.layer.cornerRadius = 8
        self.setupColor()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMainViewPressed))
        self.mainView.addGestureRecognizer(tapGesture)
        self.clipsToBounds = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.detailsLabel.isHidden = false
        self.setupColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10
        self.layer.shadowColor = Palette.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    private func setupColor() {
        self.mainView.backgroundColor = Palette.viewBGColor
        self.titleLabel.textColor = Palette.Text.primary
        self.detailsLabel.textColor = Palette.Text.placeholder
    }
    
    @objc private func handleMainViewPressed() {
        self.activityIndicator.startAnimating()
        self.delegate?.didSelectMainViewPressed(self)
    }
    
    @objc private func handleStopActivityRefreshing() {
        self.activityIndicator.stopAnimating()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
