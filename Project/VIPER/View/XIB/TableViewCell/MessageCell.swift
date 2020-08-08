//
//  MessageCell.swift
//  Project
//
//  Created by AppleMac on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImg : UIImageView!
    @IBOutlet weak var msgeCountView : UIView!
    @IBOutlet weak var msgeCountLbl : UILabel!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var dateLbl : UILabel!
    @IBOutlet weak var msgeLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupView()
    }
    
    func setupView(){
        Common().hexgonView(view: self.userImg, color: .primary, linewith: 3)
        Common().hexgonView(view: self.msgeCountView, color: .white, linewith: 3)
        Common.setFont(to: self.nameLbl, isTitle: true, size: 20)
        Common.setFont(to: self.dateLbl, isTitle: false, size: 13)
        Common.setFont(to: self.msgeLbl, isTitle: false, size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
