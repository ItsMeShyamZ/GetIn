//
//  LaunchViewController.swift
//  Project
//
//  Created by Sethuram Vijayakumar on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import ObjectMapper

class LaunchViewController: UIViewController {
    @IBOutlet weak var launchView: UIView!
    @IBOutlet weak var launchImageView: UIImageView!
    @IBOutlet weak var viewSigninUser: UIView!
    @IBOutlet weak var viewSigninProvider: UIView!
    @IBOutlet weak var buttonSigninUser: UIButton!
    @IBOutlet weak var buttonSigninProvider: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalLoads()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.designs()
      
    }
}


extension LaunchViewController {
    
    private func designs(){
    self.launchView.layer.cornerRadius = 125
    self.launchView.layer.masksToBounds = true
    self.launchView.layer.maskedCorners = [.layerMinXMaxYCorner]
    self.launchView.dropShadow()
        
    self.viewSigninProvider.layer.cornerRadius = 10
    self.viewSigninUser.layer.cornerRadius = 10
    self.viewSigninProvider.layer.borderWidth = 1
    self.viewSigninProvider.layer.borderWidth = 1
    self.viewSigninProvider.layer.borderColor = UIColor.primary.cgColor
    self.viewSigninUser.layer.borderColor = UIColor.white.cgColor
        Common.setFont(to: self.buttonSigninUser, isTitle: true, size: 20)
        Common.setFont(to: self.buttonSigninProvider, isTitle: true, size: 20)
    }
    
    private func initalLoads(){
        self.viewSigninUser.backgroundColor = .primary
        self.viewSigninProvider.backgroundColor = .white
        self.buttonSigninUser.setTitle(Constants.string.signInUser.localize(), for: .normal)
        self.buttonSigninProvider.setTitle(Constants.string.signInProvider.localize(), for: .normal)
        self.buttonSigninUser.setTitleColor(.white, for: .normal)
        self.buttonSigninProvider.setTitleColor(.primary, for: .normal)
        self.setupAction()
    }
    
    func setupAction(){
        self.buttonSigninProvider.addTap{
//            showToasts(msg: "Hello")
            self.push(id: Storyboard.Ids.TapBarVC, animation: true, from: Router.home)
        }
        self.buttonSigninUser.addTap {
            self.push(id: Storyboard.Ids.SinginViewController, animation: true, from: Router.main)
        }
    }
}

extension LaunchViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        
    }
    
    func showError(error: CustomError) {
        
    }
    
    
}
