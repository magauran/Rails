//
//  AppColors.swift
//  Rails
//
//  Created by Azizbek Asadov on 10/04/21.
//

import UIKit

enum AppColors : UInt32, CaseIterable {
    
    case myHomeBG = 0xFEFEFE//0x4A389C
    /// 0x8BC43F
    case lightGreenBGColor = 0x8BC43F
    
    /// 0xA77FC5
    case purpleBGColor = 0xA77FC5
    
    /// used for home phone textfield
    case homeMobileTextFieldColor = 0x383839
    
    /// 0xEE6114
    case appDarkColor = 0xEE6114
    
    /// 0xFAFAFA
    case orderCardBackground = 0xFAFAFA
    
    /// 0xE5E5E5
    case borderGreyColor = 0xE5E5E5
    
    /// 0xF22931
    case red = 0xF22931
    
    /// 0x2EB96E
    case greenProgressBarColor = 0x2EB96E
    
    /// 0x383838
    case grayishBlackColor = 0x383838
    
    /// 0xF8F8F8
    case homeBackgroundColor = 0xF8F8F8
    
    /// 0xF54291
    case pinkLightDepositColor = 0xF54291
    
    /// 0xBA9313
    case goldenYellow = 0xBA9313

    /// 0xEFF0F3
    case mediumGrayColor = 0xEFF0F3
    
    /// 0x6138B8
    case darkpurple = 0x6138B8
    
    /// 0x5E4CCE
    case lightPurple = 0x5E4CCE
    
    /// 0x0075FF
    case brightBlue = 0x0075FF
    
    /// 0x66acff
    case lightBlue = 0x66ACFF
    
    /// 0x0EA434
    case darkGreen = 0x0EA434
    
    /// 0xF22929
    case brightPink = 0xF22929
    
    /// 0x8D9093
    case lightGray = 0x8D9093
    
    /// 0xF6B100
    case darkOrangeColor = 0xF6B100
    
    /// 0xEE8208
    case appColor = 0xEE8208//0xFD7435
    
    /// 0x3E3E3E
    case textColor = 0x3E3E3E
    
    /// 0x1A1A1A
    case titleColor = 0x1A1A1A
    
    /// 0xA0A4A7
    case lightTextColor = 0xA0A4A7
    
    /// 0xEEEEEE
    case theBankCategoryCellBG = 0xEEEEEE
    
    /// 0xF0F1F2
    case textFieldAndButtonBG = 0xF0F1F2
    
    /// 0xF0F1F2 for ListButton not for textFields
    case buttonsBGColor = 0xF0F1F3
    
    /// 0x222222
    case selectedTextOrImage = 0x222222
    
    /// 0xF5F5F5
    case greyBackgroundColor = 0xF5F5F5
    
    /// 0xFDFDFD
    case collectionViewColor = 0xFDFDFD
    
    /// 0xFFFFFF
    case viewBackgroundColor = 0xFFFFFF
    
    /// 0xC2C5C8
    case searchbarAndOtherTxtFields = 0xC2C5C8
    
    /// 0x24BD4B
    case infoBackgroundColor = 0x24BD4B
    
    /// 0xDCF3E2
    case lightGreen = 0xDCF3E2
    
    /// 0xFBDDDD
    case lightRed = 0xFBDDDD
    
    /// 0xE1E1E1
    case lightlightgray = 0xe1e1e1
    
    /// titleColor, darkOrangeColor, searchbarAndOtherTxtFields
    case bonusViewColor = 0x1DA95D
    
    var color: UIColor {
//        if AppData.blackMode {
//            switch self {
//            case .myHomeBG:
//                return UIColor(hex: 0x4A389C)
//            case .viewBackgroundColor:
//                return UIColor(hex: 0x171717)
//            case .selectedTextOrImage:
//                return UIColor(hex: 0xFFFFFF)
//            case .homeBackgroundColor:
//                return UIColor(hex: 0x0A0A0A)
//            case .greyBackgroundColor:
//                return UIColor(hex: 0x0A0A0A)
//            case .grayishBlackColor:
//                return UIColor(hex: 0xFFFFFF)
//            case .lightGray:
//                return UIColor(hex: 0x868686)
//            case .titleColor:
//                return UIColor(hex: 0x4C4C4C)
//            case .textColor:
//                return UIColor(hex: 0xFFFFFF)
//            case .buttonsBGColor:
//                return UIColor(hex: 0x0A0A0A)
//            case .homeMobileTextFieldColor:
//                return UIColor.lightGray
//            default:
//                return UIColor(hex: self.rawValue)
//            }
//        } else {
        return UIColor(rgb: self.rawValue)
//        }
    }
    
}
