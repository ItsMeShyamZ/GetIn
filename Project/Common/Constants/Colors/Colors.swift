//
//  Colors.swift
//  User
//
//  Created by imac on 12/22/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import UIKit

enum Color : Int {
    
    case primary = 1
    case secondary = 2
    case lightBlue = 3
    case brightBlue = 4
    
    
    static func valueFor(id : Int)->UIColor?{
        
        switch id {
        case self.primary.rawValue:
            return .primary
        
            
        default:
            return nil
        }
        
        
    }
    
    
}

extension UIColor {
    
    // Primary Color
    public static var primary : UIColor {
        return #colorLiteral(red: 0.1333333333, green: 0.8235294118, blue: 0.8862745098, alpha: 1)
    }
    
    // Primary Color
    public static var primaryBlue : UIColor {
        return UIColor(named: "primaryBlue")!
    }
    
    // Primary Color
    public static var google : UIColor {
        return UIColor(named: "google")!
    }
    
    // Primary Color
    public static var fb : UIColor {
        return UIColor(named: "fb")!
    }
    
    
    
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let backgroundColor = UIColor.rgb(r: 21, g: 22, b: 33)
    static let outlineStrokeColor = UIColor.rgb(r: 234, g: 46, b: 111)
    static let trackStrokeColor = UIColor.rgb(r: 56, g: 25, b: 49)
    static let pulsatingFillColor = UIColor.rgb(r: 86, g: 30, b: 63)
    
    
}
