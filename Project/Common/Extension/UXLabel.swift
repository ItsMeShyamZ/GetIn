//
//  UXLabel.swift
//  MiDokter User
//
//  Created by AppleMac on 15/06/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 10.0
    @IBInspectable var bottomInset: CGFloat = 10.0
    @IBInspectable var leftInset: CGFloat = 10.0
    @IBInspectable var rightInset: CGFloat = 10.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.insetBy(dx: topInset, dy: leftInset))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}

extension UILabel{
    public func setText(_ textKey : String , _ size : Int = 16 , fontStyle type : FontType = .regular , isTitle istitle : YesNoType = .no , textColor color : UIColor = UIColor.black){
        var fontStyle : String = ""
        var foneSize : Int = 0
        switch type {
            case .bold:
                fontStyle = "SystemFont-Bold"
            case .light:
                fontStyle = "SystemFont-Light"
            case .regular:
                fontStyle = "SystemFont"
            default:
                fontStyle = "SystemFont"
        }
        
        switch istitle {
            case .no:
                foneSize = size
            case .yes:
                foneSize = 20
            
            default:
                foneSize = size
        }
        
        let customText = NSMutableAttributedString(string: Localize.stringForKey(key: textKey), attributes: [
            NSAttributedString.Key.font:UIFont(name: fontStyle, size: CGFloat(foneSize)) ?? UIFont.systemFont(ofSize: CGFloat(foneSize)),
            NSAttributedString.Key.foregroundColor : color
        ])
        self.attributedText = customText
        self.adjustsFontSizeToFitWidth = true
    }
    
    
    func multiColorText(text : [String] ,color : [UIColor],size : [Int] ){
        var data = NSMutableAttributedString()
        for i in 0..<text.count{
            data.append(NSMutableAttributedString(string:text[i], attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: CGFloat(size[i])), NSAttributedString.Key.foregroundColor : color[i]]))
        }
          
        self.attributedText = data
    }
    
}
    
public enum FontType{
    case bold
    case light
    case regular
}

extension UIButton{
    
    public func setText(_ textKey : String , _ size : Int = 20 , _ type : FontType = .bold,textColor color : UIColor = UIColor.white , bgColor : UIColor = UIColor.clear){
        var fontStyle : String = ""
        switch type {
            case .bold:
                fontStyle = "Calibri-Bold"
            case .light:
                fontStyle = "Calibri-Light"
            case .regular:
                fontStyle = "Calibri"
            default:
                fontStyle = "Calibri"
        }
        self.backgroundColor = bgColor
        let customButtonTitle = NSMutableAttributedString(string: Localize.stringForKey(key: textKey), attributes: [
            NSAttributedString.Key.font:UIFont(name: fontStyle, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size)),
            NSAttributedString.Key.foregroundColor : color
        ])
        self.setAttributedTitle(customButtonTitle, for: .normal)
    }
}
