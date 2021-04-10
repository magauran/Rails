//
//  SearchTableViewCell.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit

struct SearchItem {
    let title: String
    let desc: String
}

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var data: SearchItem! {
        didSet {
            self.titleLabel.text = data.title
            self.detailsLabel.text = data.desc
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.detailsLabel.style = StringStyle {
            $0.font = Font.regular(11)
            $0.color = Palette.Text.placeholder
        }
        self.titleLabel.style = StringStyle {
            $0.font = Font.regular(15)
            $0.color = Palette.Text.primary
        }
    }
}
