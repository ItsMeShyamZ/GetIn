//
//  CreatePostViewController.swift
//  Project
//
//  Created by AppleMac on 19/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {

    @IBOutlet weak var headerView : UIView!
    @IBOutlet weak var backImg : UIImageView!
    @IBOutlet weak var createPostLbl : UILabel!
    @IBOutlet weak var postBtn : UIButton!
    
    @IBOutlet weak var userNameLbl : UILabel!
    @IBOutlet weak var userImg : UIImageView!
    @IBOutlet weak var writeText : UITextView!
    
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var photoLbl : UILabel!
    @IBOutlet weak var photoImg : UIImageView!
    @IBOutlet weak var tagLbl : UILabel!
    @IBOutlet weak var tagImg : UIImageView!
    @IBOutlet weak var hastTagLbl : UILabel!
    @IBOutlet weak var hastTagImg : UIImageView!
    @IBOutlet weak var feelingLbl : UILabel!
    @IBOutlet weak var feelingImg : UIImageView!
    @IBOutlet weak var cameraLbl : UILabel!
    @IBOutlet weak var cameraImg : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupAction()
    }
    
    func setupView(){
        self.bottomView.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 50)
        self.cameraLbl.text = Constants.string.Camera
        self.feelingLbl.text = Constants.string.feeling
        self.hastTagLbl.text = Constants.string.hashTag
        self.tagLbl.text = Constants.string.tagPepole
        self.photoLbl.text = Constants.string.photoVideo
        self.createPostLbl.text  = Constants.string.getIn
        Common().hexgonView(view: self.userImg, color: .primary, linewith: 1)
    }
    
    func setupAction(){
        self.backImg.addTap {
            self.pop(from: self)
        }
        self.postBtn.addTap {
            
        }
    }

}
