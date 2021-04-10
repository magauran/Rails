//
//  NotificationsableViewCell.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit

struct NotificationModel {
    let title: String
    let desc: String
    let canEdit: Bool
}

class NotificationsableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var dotsBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    var data: NotificationModel! {
        didSet {
            self.titleLabel.text = data.title
            self.descLabel.text = data.desc
            self.skipBtn.superview?.isHidden = !data.canEdit
            self.mainView.backgroundColor = data.canEdit ? Palette.Button.primary.withAlphaComponent(0.35) : Palette.viewBGColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.style = StringStyle {
            $0.font = Font.semiBold(15)
            $0.color = Palette.Text.primary
            $0.maximumLineHeight = 2
        }
        
        self.descLabel.style = StringStyle {
            $0.font = Font.semiBold(15)
            $0.color = Palette.Text.primary
        }
        
        self.changeBtn.backgroundColor = Palette.Button.primary
        self.changeBtn.setTitleColor(UIColor.white, for: .normal)
        self.skipBtn.setTitleColor(Palette.Button.primary, for: UIControl.State.normal)
        self.mainView.backgroundColor = data.canEdit ? Palette.Button.primary.withAlphaComponent(0.35) : Palette.viewBGColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainView.layer.cornerRadius = 8
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.skipBtn?.superview?.isHidden = true
    }
}
