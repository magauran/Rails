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
    @IBOutlet private var stackView: UIStackView!

    var data: NotificationModel! {
        didSet {
            self.titleLabel.styledText = data.title
            self.descLabel.styledText = data.desc
            self.skipBtn.superview?.isHidden = !data.canEdit
            self.mainView.backgroundColor = data.canEdit ? UIColor(rgb: 0xC00733, alpha: 0.05) : Palette.viewBGColor
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
            $0.font = Font.regular(15)
            $0.color = Palette.Text.primary
        }

        self.changeBtn.titleLabel?.font = Font.semiBold(13)
        self.changeBtn.setBackgroundImage(Palette.Button.primary.image(), for: .normal)
        self.changeBtn.layer.cornerRadius = 6
        self.changeBtn.layer.cornerCurve = .continuous
        self.changeBtn.clipsToBounds = true
        self.changeBtn.setTitleColor(UIColor.white, for: .normal)
        self.skipBtn.titleLabel?.font = Font.semiBold(13)
        self.skipBtn.setTitleColor(Palette.Button.primary, for: UIControl.State.normal)
        self.stackView.setCustomSpacing(10, after: self.descLabel)
        self.selectionStyle = .none
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
