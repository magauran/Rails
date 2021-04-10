//
//  SpotDetailsViewController.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit
import PanModal

class SpotDetailsViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var distLabel: UILabel!
    @IBOutlet weak var routeButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    var spot: Spot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.routeButton.layer.cornerRadius = 8
        self.routeButton.backgroundColor = Palette.beigeColor.color
        self.routeButton.tintColor = Palette.Text.primary
        self.routeButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        self.titleLabel.style = StringStyle {
            $0.color = Palette.Text.primary
            $0.font = Font.semiBold(17)
            $0.maximumLineHeight = 30
        }
        
        self.descLabel.style = StringStyle {
            $0.color = Palette.Text.primary
            $0.font = Font.regular(13)
            $0.maximumLineHeight = 30
        }
        
        self.distLabel.style = StringStyle {
            $0.color = Palette.Text.placeholder
            $0.font = Font.regular(13)
            $0.maximumLineHeight = 30
        }
        
        self.distLabel.text = self.spot.distance
        self.titleLabel.text = self.spot.title
        self.descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        self.imageView.image = UIImage(named: "building")
    }
    
    @IBAction func handleClosePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension SpotDetailsViewController : PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(360)
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(360)
    }
    
    var cornerRadius: CGFloat {
        return 16
    }
    
    var allowsExtendedPanScrolling: Bool {
        return false
    }

}
