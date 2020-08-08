//
//  HomeViewController.swift
//  Project
//
//  Created by AppleMac on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeViewController: UIViewController {

    @IBOutlet weak var userImage : UIImageView!
    @IBOutlet weak var createPostDocImg : UIImageView!
    @IBOutlet weak var createPostTxt : UITextField!
    @IBOutlet weak var createPostView : UIView!
    @IBOutlet weak var createPostBtn : UIButton!
    
    @IBOutlet weak var newPostTable : UITableView!
    
    var Homedata : HomeEntity = HomeEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getdashboardData()
    }
    
}
extension HomeViewController{
    func initialLoad(){
        self.setupView()
        self.setupTableView()
        self.setupAction()
    }
    func setupView(){
        self.createPostDocImg.setImage(.jem, .yes, .black)
        Common().hexgonView(view: self.userImage, color:  UIColor.primary, linewith: 5.0)
    }
    
    func setupAction(){
        self.createPostBtn.addTap {
            self.push(from: self, ToViewContorller: CreatePostViewController.initVC(storyBoardName: .home, vc: CreatePostViewController.self, viewConrollerID: Storyboard.Ids.creatPostVC))
        }
    }
   
}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Homedata.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.Ids.PostCell, for: indexPath) as! PostCell
        if let post = self.Homedata.posts?[indexPath.row]{
            cell.userNameLbl.text = post.user?.first_name ?? ""
            cell.contentLbl.text = post.user?.email ?? ""
            
            cell.userImag.setURLImage(post.user?.picture ?? "")
            if post.is_liked ?? 0 == 1{
                cell.likeImg.changeImgaTint(withTintColor : UIColor.primary)
                cell.likeLbl.textColor = .primary
            }
            if post.image?.count ?? 0 >= 1{
                cell.postImg.setURLImage(post.image?[0].image ?? "",.yes)
            }
            
        }
        
        cell.likeBtn.addTap {
            Common().animateSelection(image: cell.likeLbl)
            Common().animateSelection(image: cell.likeImg)
            if let post = self.Homedata.posts?[indexPath.row]{
            var likedata = LikeReq()
                likedata.like_id = "\(post.likes_types?[0].id ?? 0)"
                likedata.user_id = "\(self.Homedata.id ?? 0 )"
                likedata.post_id = "\(post.id ?? 0)"
            self.likeApi(likeDetail: likedata)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.push(from: self, ToViewContorller: PostDetailViewController.initVC(storyBoardName: .home, vc: PostDetailViewController.self, viewConrollerID: Storyboard.Ids.postDetailVC))
    }
    
    func setupTableView(){
        self.newPostTable.delegate = self
        self.newPostTable.dataSource = self
        self.newPostTable.registerCell(withId:TableView.Ids.PostCell)
    }
}

extension HomeViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.HomeEntity:
                var data = dataDict as? HomeEntity
                self.Homedata = data ?? HomeEntity()
                self.newPostTable.reloadData()
                break
            case model.type.CommonEntity:
                self.getdashboardData()
            break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func getdashboardData(){
        self.presenter?.HITAPI(api: Base.dashboard.rawValue, params: nil, methodType: .GET, modelClass: HomeEntity.self, token: true)
    }
    
    
    func likeApi(likeDetail : LikeReq){
        self.presenter?.HITAPI(api: Base.like.rawValue, params: convertToDictionary(model: likeDetail), methodType: .POST, modelClass: CommonEntity.self, token: true)
    }
    
}
