//
//  NotificationCell.swift
//  Project
//
//  Created by AppleMac on 19/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var userImg : UIImageView!
    @IBOutlet weak var statusImg : UIImageView!
    @IBOutlet weak var notifyCountView : UIView!
    @IBOutlet weak var notifyCountLbl : UILabel!
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var statusLbl : UILabel!
    @IBOutlet weak var yourLbl : UILabel!
    @IBOutlet weak var statusUpdateLbl : UILabel!
    @IBOutlet weak var dateLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupView()
    }
    
    func setupView(){
        Common().hexgonView(view: self.userImg, color: .primary, linewith: 3)
        Common().hexgonView(view: self.notifyCountView, color: .white, linewith: 3)
        Common.setFont(to: self.nameLbl, isTitle: true, size: 20)
        Common.setFont(to: self.statusLbl, isTitle: false, size: 13)
        Common.setFont(to: self.statusUpdateLbl, isTitle: true, size: 20)
        Common.setFont(to: self.yourLbl, isTitle: false, size: 15)
        Common.setFont(to: self.dateLbl, isTitle: false, size: 13)
        Common.setFont(to: self.notifyCountLbl, isTitle: false, size: 15)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}
