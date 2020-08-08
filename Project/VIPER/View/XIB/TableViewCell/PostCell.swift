//
//  PostCell.swift
//  Project
//
//  Created by AppleMac on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var userImag : UIImageView!
    @IBOutlet weak var menuImg : UIImageView!
    @IBOutlet weak var userNameLbl : UILabel!
    @IBOutlet weak var dateTimeLbl : UILabel!
    @IBOutlet weak var contentLbl : UILabel!
    @IBOutlet weak var postImg : UIImageView!
    
    @IBOutlet weak var likeBtn : UIButton!
    @IBOutlet weak var disLikeBtn : UIButton!
    @IBOutlet weak var commentBtn : UIButton!
    @IBOutlet weak var shareBtn : UIButton!
    
    
    @IBOutlet weak var likeLbl : UILabel!
    @IBOutlet weak var disLikeLbl : UILabel!
    @IBOutlet weak var commentLbl : UILabel!
    @IBOutlet weak var shareLbl : UILabel!
    
    @IBOutlet weak var likeImg : UIImageView!
    @IBOutlet weak var disLikeImg : UIImageView!
    @IBOutlet weak var commentImg : UIImageView!
    @IBOutlet weak var shareImg : UIImageView!
    
    @IBOutlet weak var postBGView : UIView!
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var footerView : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupView()
        self.setupAction()
    }
    
    func setupView(){
        self.postBGView.setCorneredElevation(shadow: 2, corner: 15, color: .gray)
        self.headerView.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 15)
        self.footerView.roundCorners([.layerMinXMaxYCorner,.layerMaxXMaxYCorner], radius: 15)
        Common().hexgonView(view: self.userImag, color: .primary, linewith: 3.0)
        Common.setFont(to: self.userNameLbl, isTitle: true, size: 20)
        Common.setFont(to: self.dateTimeLbl, isTitle: false, size: 15)
        Common.setFont(to: self.contentLbl, isTitle: false, size: 17)
        [self.likeLbl,self.commentLbl,self.shareLbl,self.disLikeLbl].forEach { (label) in
            Common.setFont(to: label, isTitle: false, size: 15)
        }
    }
    
    func setupAction(){
//        self.likeBtn.addTap {
//            Common().animateSelection(image: self.likeLbl)
//            Common().animateSelection(image: self.likeImg)
//        }
        self.commentBtn.addTap {
            Common().animateSelection(image: self.commentLbl)
            Common().animateSelection(image: self.commentImg)
        }
        self.shareBtn.addTap {
            Common().animateSelection(image: self.shareLbl)
            Common().animateSelection(image: self.shareImg)
        }
        self.disLikeBtn.addTap {
            Common().animateSelection(image: self.disLikeLbl)
            Common().animateSelection(image: self.disLikeImg)
        }
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
