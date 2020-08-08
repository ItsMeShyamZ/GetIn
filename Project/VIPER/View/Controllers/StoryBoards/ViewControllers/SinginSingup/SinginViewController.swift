//
//  SinginViewController.swift
//  Project
//
//  Created by AppleMac on 26/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import ObjectMapper

class SinginViewController: UIViewController {
    
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var headingLbl : UILabel!
    @IBOutlet weak var signinView : UIView!
    @IBOutlet weak var emailView : UIView!
    @IBOutlet weak var passwordView : UIView!
    @IBOutlet weak var emailIcon : UIImageView!
    @IBOutlet weak var passwordIcon : UIImageView!
    @IBOutlet weak var emailTxt : UITextField!
    @IBOutlet weak var passwordTxt : UITextField!
    @IBOutlet weak var forgotBtn : UIButton!
    @IBOutlet weak var singinBtn : UIButton!
    @IBOutlet weak var singupBtn : UIButton!
    @IBOutlet weak var singupLbl : UILabel!
    @IBOutlet weak var singinWithLbl : UILabel!
    @IBOutlet weak var orLbl : UILabel!
    @IBOutlet weak var fbView : UIView!
    @IBOutlet weak var gpView : UIView!
    @IBOutlet weak var fbIcon : UIImageView!
    @IBOutlet weak var gpIcon : UIImageView!
    @IBOutlet weak var gpLbl : UILabel!
    @IBOutlet weak var fblbl : UILabel!
    @IBOutlet weak var gpBtn : UIButton!
    @IBOutlet weak var fbBtn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialLoad()
    }
    
}
extension SinginViewController{
    func setupFont(){
        [self.emailTxt,self.passwordTxt].forEach { (txt) in
            Common.setFont(to: txt, isTitle: true, size: 16)
        }
        Common.setFont(to: self.titleLbl, isTitle: true, size: 50)
        Common.setFont(to: self.headingLbl, isTitle: true, size: 25)
        Common.setFont(to: self.singinWithLbl, isTitle: true, size: 16)
        Common.setFont(to: self.singupLbl, isTitle: false, size: 14)
        Common.setFont(to: self.singupBtn, isTitle: true, size: 16)
        Common.setFont(to: self.singinBtn, isTitle: true, size: 20)
        Common.setFont(to: self.forgotBtn, isTitle: true, size: 17)


    }
    
    func setupLng(){
        self.titleLbl.text = Constants.string.getin
        self.headingLbl.text = Constants.string.singin
        self.emailTxt.placeholder = Constants.string.email
        self.passwordTxt.placeholder = Constants.string.password
        self.forgotBtn.setTitle(Constants.string.forgorPass, for: .normal)
        self.singinBtn.setTitle(Constants.string.singin, for: .normal)
        self.singupBtn.setTitle(Constants.string.signupNow, for: .normal)
        self.singupLbl.text = Constants.string.donthaveAcc
        self.singinWithLbl.text = Constants.string.singinWith
        self.orLbl.text = Constants.string.or
        self.fblbl.text = Constants.string.facebook
        self.gpLbl.text = Constants.string.google
    }
    
    func setupAction(){
        self.fbBtn.addTap {
            print("fbBtn")
        }
        self.gpBtn.addTap {
            print("gpBtn")
            
        }
        self.singinBtn.addTap {
            self.validation()
//
        
//            self.push(id: Storyboard.Ids.TapBarVC, animation: true, from: Router.home)
        }
        
        self.singupBtn.addTap {
            print("singupBtn")
        }
        
        self.forgotBtn.addTap {
            print("Forgot")
        }
        
    }
    
    func validation(){
        var email = self.emailTxt.getText
        var pass = self.passwordTxt.getText
        
        guard let emails : String = self.emailTxt.getText , emails.isEmpty != true else {
            showToasts(msg: "Enter Email Address")
            return
        }
        
        guard let password : String  = self.passwordTxt.getText , password.isEmpty != true else {
            showToasts(msg: "Password should not be empty")
            return
        }
        
        var loginreq = LoginReq()
        loginreq.username = self.emailTxt.getText
        loginreq.password = self.passwordTxt.getText
        self.postLogin(loginData: loginreq)
        
        
    }
    
    
    func setupView(){
        self.titleLbl.textColor = .primaryBlue
        self.headingLbl.textColor = .black
        self.forgotBtn.setTitleColor(.primary, for: .normal)
        self.singupLbl.textColor = .black
        self.singupBtn.setTitleColor(.primary, for: .normal)
        self.singinBtn.setTitleColor(.white, for: .normal)
        self.singinBtn.backgroundColor = .primary
        self.fbView.backgroundColor = .fb
        self.gpView.backgroundColor = .google
        self.fblbl.textColor = .white
        self.gpLbl.textColor = .white
        self.fbIcon.setImage(.facebook)
        self.gpIcon.setImage(.googleplus)
        self.emailIcon.setImage(.mail)
        self.passwordIcon.setImage(.password)
        
        self.orLbl.textColor = .google
    }
    func initialLoad(){
        self.setupFont()
        self.setupLng()
        self.setupAction()
        self.setupView()
    }
}

extension SinginViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        switch String(describing: modelClass) {
            case model.type.LoginEntity:
                var data = dataDict as? LoginEntity
                if !(data?.access_token ?? "").isEmpty{
                    //UserDefaultConfig.Token = data?.access_token ?? ""
                    UserDefaultConfig.Token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI0NDRkNWFjOGE0ZTA2ODBmZDVhNDVkM2I5YTUyOGNjZjQyY2EyMjA0ODNhNjI0NDY3NTc1OGMxZjgzZTQxZmJiNzViNTIwODc1ZTEzMTJlIn0.eyJhdWQiOiIyIiwianRpIjoiMjQ0NGQ1YWM4YTRlMDY4MGZkNWE0NWQzYjlhNTI4Y2NmNDJjYTIyMDQ4M2E2MjQ0Njc1NzU4YzFmODNlNDFmYmI3NWI1MjA4NzVlMTMxMmUiLCJpYXQiOjE1OTYyNjc4MjAsIm5iZiI6MTU5NjI2NzgyMCwiZXhwIjoxNTk3NTYzODE5LCJzdWIiOiIxMjUiLCJzY29wZXMiOltdfQ.T69qQM9ZAlp9bN3qzy9zvmYfU9vriITmyrJFqC6ZCcQrkiYQvPDSL7s-yJEUSSQQ7XSFi6JnmiCqWEeR51q7jLmue0gBFGEo7W3EdmXcOt6VqmIXqC90_a0AW_7YDz7EqxWqx3SaTA_LytqXnzo30rHQp37AKBmojAABpb_ylNMs0Ah6fV_nVnxWvukdeTjahZa-sJC8JxMD6beppNzxpR2K_thPpCNxBwgNvUllamaEr9LeH9XwKjVrB59vamIx1psa5GmNt5NFCBMbEf1Ss4Nfn5pIdud2pjW_pD4pUhafxxhJFxZw5zZdzz8AC-s1n9e9PmW--8nXE9m3W8sTUkx3fI-yBgiEHRXHUz9a0ZApG8B5bMs8H7V5WrHWWyGSpo2dUGduNCf8zZCwigIl5sBDq098fApEQedRTWfbSVg33IdwsfsTTj_c9f7bXeQqd6DIinGn2buKZIbSL2WRjT3i2vSpX5kOKxDO3JidpsAOIBHchaxlsY80RC10OK3Lq1Uzklx8oAQycmKfUgQ6ZAhLWNMg7cKvUpOk5-34AFeN_wHv39rhi13_OIntnRGCfF893rxITAANnl7RF7Sfai8xPnOaAJ8v_merbJH0-SCK1fOtLYi6lykzG0dhX3I8eJ8jt0MgqB3wB7mlMYHGmxx7V3TMhkvF29K5bLARZPA"
                   self.push(id: Storyboard.Ids.TapBarVC, animation: true, from: Router.home)
                }else{
                    showToasts(msg: "The given data was invalid.")
                }
                break
            default: break
        }
    }
    
    func showError(error: CustomError) {
        print("Error",error)
    }
    
    
    func postLogin(loginData : LoginReq){
        self.presenter?.HITAPI(api: Base.login.rawValue, params: convertToDictionary(model: loginData), methodType: .POST, modelClass: LoginEntity.self, token: true)
    }
    
}
