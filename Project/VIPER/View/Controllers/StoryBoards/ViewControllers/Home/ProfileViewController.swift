//
//  ProfileViewController.swift
//  Project
//
//  Created by AppleMac on 19/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTable : UITableView!
    @IBOutlet weak var profileTableHeight : NSLayoutConstraint!

    
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

    
    @IBOutlet weak var TblprofileImg : UIImageView!
    @IBOutlet weak var TblnameLbl : UILabel!
    @IBOutlet weak var TbldateLbl : UILabel!
    @IBOutlet weak var TblHeadwerView : UIView!
    @IBOutlet weak var postListView : UIView!
    
    
    var profiledata : HomeEntity = HomeEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupView()
        self.setupLang()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getprofiledData()
    }
    
    override func viewDidLayoutSubviews() {
        profileTableHeight.constant = profileTable.contentSize.height + 120
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
    }
    
    func setupLang(){
        self.postLbl.text = Constants.string.post
        self.friendsLbl.text = Constants.string.firends
    }
    
    func setupDate(){
        if let data : HomeEntity = self.profiledata{
            self.bannerImg.setURLImage(data.cover ?? "",.no)
            self.profileImg.setURLImage(data.picture ?? "",.no)
            self.nameLbl.text = (data.first_name ?? "") + " " + (data.last_name ?? "") ?? ""
            self.mailLbl.text = data.email ?? ""
            self.postCountLbl.text = "\(data.total_posts ?? 0 )"
            self.friendsCountLbl.text = "\(data.total_friends ?? 0 )"
            self.TblnameLbl.text = data.first_name ?? ""
            self.TbldateLbl.text = data.email ?? ""
            
            self.profileImg.setURLImage(data.picture ?? "",.no)
            
        }
    }
}

extension ProfileViewController : UITableViewDelegate,UITableViewDataSource {
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profiledata.post?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.Ids.MyPostCell, for: indexPath) as! MyPostCell
       
        if let post = self.profiledata.post?[indexPath.row]{
             if post.is_liked ?? 0 == 1{
                cell.likeImg.changeImgaTint(withTintColor : UIColor.primary)
                cell.likeLbl.textColor = .primary
            }
            if post.image?.count ?? 0 >= 1{
                cell.postImg.setURLImage(post.image?[0].image ?? "",.yes)
            }
            
        }
        
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

extension ProfileViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.HomeEntity:
                var data = dataDict as? HomeEntity
                self.profiledata = data ?? HomeEntity()
                self.profileTable.reloadData()
                self.setupDate()
                break
            case model.type.CommonEntity:
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func getprofiledData(){
        self.presenter?.HITAPI(api: Base.profile.rawValue, params: nil, methodType: .GET, modelClass: HomeEntity.self, token: true)
    }
    
    
    func likeApi(likeDetail : LikeReq){
        self.presenter?.HITAPI(api: Base.like.rawValue, params: convertToDictionary(model: likeDetail), methodType: .POST, modelClass: CommonEntity.self, token: true)
    }
    
}
