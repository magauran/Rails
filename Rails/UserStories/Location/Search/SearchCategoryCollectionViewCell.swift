//
//  SearchCategoryCollectionViewCell.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit

class SearchCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var data: SearchCategory? {
        didSet {
            if let data = self.data {
                self.titleLabel.text = data.title
                self.logoImageView.image = UIImage(named: data.image)?
                    .withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel.style = StringStyle {
            $0.color = Palette.Text.primary
            $0.font = Font.semiBold(15)
        }
        self.logoImageView.contentMode = .scaleAspectFit
        self.logoImageView.tintColor = Palette.Text.primary
        self.contentView.backgroundColor = .clear
        self.mainView.backgroundColor = Palette.viewBGColor.color
        self.clipsToBounds = false
        self.mainView.clipsToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.shadowColor = Palette.shadowColor.withAlphaComponent(1).cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 12)
        
    }
}
