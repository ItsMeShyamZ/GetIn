//
//  ProfileHeaderView.swift
//  Project
//
//  Created by AppleMac on 19/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var bannerImg : UIImageView!
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var followerCount : UILabel!
    @IBOutlet weak var followerCountView : UIView!
    
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var mailLbl : UILabel!
    @IBOutlet weak var postCountLbl : UILabel!
    @IBOutlet weak var postLbl : UILabel!
    @IBOutlet weak var friendsCountLbl : UILabel!
    @IBOutlet weak var friendsLbl : UILabel!
    
    
    
    override func initView(view : UIView , vc : UIViewController) -> UIView {
        self.setupView(view: vc.view)
        self.setupView()
        self.setupLang()
        return self
    }
    
    func setupView(){
        [self.nameLbl,self.postCountLbl,self.friendsCountLbl].forEach { (label) in
            Common.setFont(to: label, isTitle: true, size: 17)
        }
        [self.mailLbl,self.postLbl,self.friendsLbl].forEach { (label) in
            Common.setFont(to: label, isTitle: false, size: 15)
        }
        
        Common().hexgonView(view: self.profileImg, color: .primary, linewith: 3)
        Common().hexgonView(view: self.followerCountView, color: .white, linewith: 2)
    }
    
    func setupLang(){
        self.postLbl.text = Constants.string.post
        self.friendsLbl.text = Constants.string.firends
    }
    
    func setupView(view : UIView){
        view.addSubview(self)
        view.bringSubviewToFront(self)
        let height =  self.frame.height < 150.0 ? 150 : self.frame.height
        self.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: self.frame.height)
        self.transform = CGAffineTransform(translationX: 0, y: 0)
        
        self.backgroundColor = .white
        
    }
    
    //MARK: Register xib view
    class var getView : ProfileHeaderView {
        return UINib(nibName: CustomView.ProfileHeaderView, bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ProfileHeaderView
    }
}
