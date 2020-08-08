//
//  UXViewController.swift
//  MiDokter User
//
//  Created by AppleMac on 16/06/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

public enum YesNoType {
    case yes
    case no
}

extension UIViewController{
    
    var identifiers : String{
        return "\(self)"
    }
    
    static func getStoryBoard(withName name : storyboardName) -> UIStoryboard{
        return UIStoryboard.init(name: name.rawValue, bundle: Bundle.main)
    }
    
    static func initVC<T : UIViewController>(storyBoardName name : storyboardName , vc : T.Type , viewConrollerID id : String) -> T{
        return getStoryBoard(withName: name).instantiateViewController(withIdentifier: id) as! T
    }
    
    func push<T : UIViewController>(from vc : T ,ToViewContorller contoller : UIViewController ){
        vc.navigationController?.pushViewController(contoller, animated: true)
    }
    
    func pop<T:UIViewController>(from vc : T){
        vc.navigationController?.popViewController(animated: true)
    }
    
    
    
    func present<T : UIViewController>(vc : T, _ isFullyPresent : YesNoType = .no){
        let vcl = vc
        if isFullyPresent == .no{
            vcl.modalPresentationStyle = .custom
        }else{
            vcl.modalPresentationStyle = .fullScreen
        }
        self.present(vc, animated: false, completion: nil)
    }
}

extension UIBezierPath {
    
    convenience init(roundedPolygonPathWithRect rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat) {
        
        self.init()
        
        let theta = CGFloat(2.0 * M_PI) / CGFloat(sides)
        let offSet = CGFloat(cornerRadius) / CGFloat(tan(theta/2.0))
        let squareWidth = min(rect.size.width, rect.size.height)
        
        var length = squareWidth - lineWidth
        
        if sides%4 != 0 {
            length = length * CGFloat(cos(theta / 2.0)) + offSet/2.0
        }
        let sideLength = length * CGFloat(tan(theta / 2.0))
        
        var point = CGPoint(x: squareWidth / 2.0 + sideLength / 2.0 - offSet, y: squareWidth - (squareWidth - length) / 2.0)
        var angle = CGFloat(M_PI)
        move(to: point)
        
        for _ in 0 ..< sides {
            point = CGPoint(x: point.x + CGFloat(sideLength - offSet * 2.0) * CGFloat(cos(angle)), y: point.y + CGFloat(sideLength - offSet * 2.0) * CGFloat(sin(angle)))
            addLine(to: point)
            
            let center = CGPoint(x: point.x + cornerRadius * CGFloat(cos(angle + CGFloat(M_PI_2))), y: point.y + cornerRadius * CGFloat(sin(angle + CGFloat(M_PI_2))))
            addArc(withCenter: center, radius:CGFloat(cornerRadius), startAngle:angle - CGFloat(M_PI_2), endAngle:angle + theta - CGFloat(M_PI_2), clockwise:true)
            
            point = currentPoint // we don't have to calculate where the arc ended ... UIBezierPath did that for us
            angle += theta
        }
        
        close()
    }
}
