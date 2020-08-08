//
//  PostDetailViewController.swift
//  Project
//
//  Created by AppleMac on 19/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var profileTable : UITableView!
    @IBOutlet weak var profileTableHeight : NSLayoutConstraint!
    
    
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var followerCount : UILabel!
    @IBOutlet weak var followerCountView : UIView!
    @IBOutlet weak var followBtn : UIButton!
    @IBOutlet weak var msgBtn : UIButton!
    
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var mailLbl : UILabel!
    @IBOutlet weak var postCountLbl : UILabel!
    @IBOutlet weak var postLbl : UILabel!
    @IBOutlet weak var friendsCountLbl : UILabel!
    @IBOutlet weak var friendsLbl : UILabel!
    
    
    @IBOutlet weak var TblprofileImg : UIImageView!
    @IBOutlet weak var TblnameLbl : UILabel!
    @IBOutlet weak var TbldateLbl : UILabel!
    @IBOutlet weak var TblHeadwerView : UIView!
    @IBOutlet weak var postListView : UIView!
    
    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var backImg : UIImageView!
    @IBOutlet weak var headerTitleLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupView()
        self.setupLang()
        self.setupAction()
    }
    
    override func viewDidLayoutSubviews() {
        profileTableHeight.constant = profileTable.contentSize.height + 10
    }
    
    func setupAction(){
        self.backImg.addTap {
            self.pop(from: self)
        }
    }
    
    func setupView(){
        [self.nameLbl,self.postCountLbl,self.friendsCountLbl].forEach { (label) in
            Common.setFont(to: label, isTitle: true, size: 17)
        }
        [self.mailLbl,self.postLbl,self.friendsLbl].forEach { (label) in
            Common.setFont(to: label, isTitle: false, size: 15)
        }
        
        Common().hexgonView(view: self.profileImg, color: .primary, linewith: 3)
        Common().hexgonView(view: self.TblprofileImg, color: .primary, linewith: 3)
        Common().hexgonView(view: self.followerCountView, color: .white, linewith: 2)
        
        Common.setFont(to: self.TblnameLbl, isTitle: true, size: 20)
        Common.setFont(to: self.TbldateLbl, isTitle: false, size: 15)
        
        self.postListView.setCorneredElevation(shadow: 2, corner: 20, color: .gray)
        self.TblHeadwerView.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 20)
        self.msgBtn.setText(Constants.string.message)
        self.followBtn.setText(Constants.string.follow)
        self.headerTitleLbl.text = Constants.string.getIn
    }
    
    func setupLang(){
        self.postLbl.text = Constants.string.post
        self.friendsLbl.text = Constants.string.firends
    }
}

extension PostDetailViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.Ids.MyPostCell, for: indexPath) as! MyPostCell
        self.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
    func setupTableView(){
        self.profileTable.delegate = self
        self.profileTable.dataSource = self
        self.profileTable.registerCell(withId:TableView.Ids.MyPostCell)
    }
}
