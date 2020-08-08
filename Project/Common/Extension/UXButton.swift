//
//  UXButton.swift
//  Smart Quarks
//
//  Created by AppleMac on 06/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func selectedButton(title:String, iconName: AssetName,  bgColor : UIColor = .clear , titleColor : UIColor = .white){
        self.backgroundColor = bgColor
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .highlighted)
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(titleColor, for: .highlighted)
        self.setImage(UIImage(named: iconName.rawValue), for: .normal)
        self.setImage(UIImage(named: iconName.rawValue), for: .highlighted)
        let imageWidth = CGFloat(30)
        let textWidth = (title as NSString).size(withAttributes:[NSAttributedString.Key.font:self.titleLabel!.font!]).width
        let width = textWidth + imageWidth + 24
        //24 - the sum of your insets from left and right
//        widthConstraints.constant = width
        self.layoutIfNeeded()
    }
}
class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
