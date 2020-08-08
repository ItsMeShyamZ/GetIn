//
//  UXImage.swift
//  MiDokter User
//
//  Created by AppleMac on 16/06/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import PINRemoteImage

enum AssetName : String{
    case home = "home"
    case mail = "mail"
    case notification = "notification"
    case user = "user"
    case jem = "jemPin"
    case facebook = "facebook"
    case googleplus = "googleplus"
    case password = "password"
}

extension UIImageView{
 
    
    func setImage(_ name : AssetName , _ withTint : YesNoType = .no, _ withTintColor : UIColor = UIColor.white ){
        if withTint == .no{
            self.image = (UIImage(named: name.rawValue) ?? UIImage())
        }else{
            if #available(iOS 13.0, *) {
                self.image = (UIImage(named: name.rawValue) ?? UIImage()).withTintColor(withTintColor)
            } else {
                if let TintImage = (UIImage(named: name.rawValue)){
                    let tintableImage = TintImage.withRenderingMode(.alwaysTemplate)
                    self.image = tintableImage
                }
                self.tintColor = withTintColor
                self.image = self.image?.imageWithColor(color: withTintColor)
            }
        }
    }
    
    func setImage(_ name : String , _ withTint : YesNoType = .no, _ withTintColor : UIColor = UIColor.white ){
        if withTint == .no{
            self.image = (UIImage(named: name) ?? UIImage())
        }else{
            if #available(iOS 13.0, *) {
                self.image = (UIImage(named: name) ?? UIImage()).withTintColor(withTintColor)
            } else {
                if let TintImage = (UIImage(named: name)){
                    let tintableImage = TintImage.withRenderingMode(.alwaysTemplate)
                    self.image = tintableImage
                }
                self.tintColor = withTintColor
                self.image = self.image?.imageWithColor(color: withTintColor)
            }
        }
    }
    
    func changeImgaTint(withTintColor : UIColor = UIColor.white){
        
        if #available(iOS 13.0, *) {
            self.image = (self.image)?.withTintColor(withTintColor)
        } else {
            if let TintImage = self.image{
                let tintableImage = TintImage.withRenderingMode(.alwaysTemplate)
                self.image = tintableImage
            }
            self.tintColor = withTintColor
            self.image = self.image?.imageWithColor(color: withTintColor)
        }
        
    }
    
    func setURLImage(_ url : String, _ withBase : YesNoType = .no){
        if !url.isEmpty{
            if withBase == .yes{
                self.pin_setImage(from: URL(string: url)!)
            }else{
                self.pin_setImage(from: URL(string: imageURL+url)!)
            }
        }
    }
    
    func getURLImage(_ url : String) -> UIImage{
        let testImage = UIImageView()
        testImage.setURLImage(url)
        return testImage.image ?? UIImage()
    }
    
}

func getImages(_ name : String , _ withTint : YesNoType = .no, _ withTintColor : UIColor = UIColor.white )-> UIImage{
    if withTint == .no{
        return (UIImage(named: name) ?? UIImage())
        
    }else{
        if #available(iOS 13.0, *) {
            return (UIImage(named: name) ?? UIImage()).withTintColor(withTintColor)
        } else {
            let testImage = UIImageView()
            testImage.image = (UIImage(named: name) ?? UIImage())
            testImage.tintColor = withTintColor
            return testImage.image ?? UIImage()
        }
    }
}

func getImage(_ name : AssetName , _ withTint : YesNoType = .no, _ withTintColor : UIColor = UIColor.white )-> UIImage{
    if withTint == .no{
        return (UIImage(named: name.rawValue) ?? UIImage())
        
    }else{
        if #available(iOS 13.0, *) {
            return (UIImage(named: name.rawValue) ?? UIImage()).withTintColor(withTintColor)
        } else {
            let testImage = UIImageView()
            testImage.image = (UIImage(named: name.rawValue) ?? UIImage())
            testImage.tintColor = withTintColor
            return testImage.image ?? UIImage()
        }
    }
}


extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
