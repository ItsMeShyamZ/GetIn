//
//  HomeViewController.swift
//  Project
//
//  Created by AppleMac on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import ObjectMapper

var previousIndex : Int = 0

class TapBarViewController: UIViewController {
    
    
    @IBOutlet weak var pageControllerView : UIView!
    @IBOutlet weak var homeImg : UIImageView!
    @IBOutlet weak var homeview : UIView!
    @IBOutlet weak var homeBGview : UIView!
    @IBOutlet weak var homeBtn : UIButton!
    
    
    @IBOutlet weak var msgImg : UIImageView!
    @IBOutlet weak var msgView : UIView!
    @IBOutlet weak var msgBgView : UIView!
    @IBOutlet weak var msgBtn : UIButton!
    
    @IBOutlet weak var notificationImg : UIImageView!
    @IBOutlet weak var notificationView : UIView!
    @IBOutlet weak var notificationBgView : UIView!
    @IBOutlet weak var notificationBtn : UIButton!
    
    @IBOutlet weak var profileImg : UIImageView!
    @IBOutlet weak var profileView : UIView!
    @IBOutlet weak var profileBgView : UIView!
    @IBOutlet weak var profileBtn : UIButton!
    
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var bottomShadowView : UIView!
    
    @IBOutlet weak var backImg : UIImageView!
    @IBOutlet weak var searchImg : UIImageView!
    @IBOutlet weak var titleLbl : UILabel!

    private var pageController : UIPageViewController?
    private var pendingIndex : Int?
    private var currentIndex : Int = 0
    
    private(set) lazy var ExploresVC : [UIViewController] = {
        return [
            HomeViewController.initVC(storyBoardName: .home, vc: HomeViewController.self, viewConrollerID: Storyboard.Ids.HomeVC),
            MessageViewController.initVC(storyBoardName: .home, vc: MessageViewController.self, viewConrollerID: Storyboard.Ids.messageVC),
            NotificationViewController.initVC(storyBoardName: .home, vc: NotificationViewController.self, viewConrollerID: Storyboard.Ids.NotifyVC),
            ProfileViewController.initVC(storyBoardName: .home, vc: ProfileViewController.self, viewConrollerID: Storyboard.Ids.ProfileVC)
        ]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
    }

}


extension TapBarViewController{
    
    func initialSetUp(){
        self.setupAction()
        self.setupView()
        self.setupPageController()
        self.setupAnimation()
    }
    
    func setupView(){
        self.homeImg.setImage(.home, .yes, .gray)
        self.msgImg.setImage(.mail, .yes, .gray)
        self.notificationImg.setImage(.notification, .yes, .gray)
        self.profileImg.setImage(.user, .yes, .gray)
        self.bottomView.roundCorners([.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 40)
        self.bottomView.layer.shadowColor = UIColor.gray.cgColor
        self.bottomView.layer.shadowOpacity = 0.7
        self.bottomView.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.bottomView.layer.shadowRadius = CGFloat(1)
        
       
    }
    
    private func setupPageController(){
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.delegate = self
        self.pageController?.dataSource = self
        self.pageController?.view.backgroundColor = .red
        self.pageController?.view.frame = self.pageControllerView.layer.bounds
        self.addChild(self.pageController!)
        self.pageControllerView.addSubview(self.pageController!.view)
        self.pageController?.isPagingEnabled = false
        
        self.pageController?.didMove(toParent: self)
        self.setVCin(PC: 0)
    }
    
    
    func setupAction(){
        self.msgBtn.addTap {
            if self.currentIndex != 1{
                self.setVCin(PC: 1)
            }
        }
        self.homeBtn.addTap {
            
            if self.currentIndex != 0{
                self.setVCin(PC: 0)
            }
        }
        self.notificationBtn.addTap {
            if self.currentIndex != 2{
                self.setVCin(PC: 2)
            }
        }
        self.profileBtn.addTap {
            if self.currentIndex != 3{
                self.setVCin(PC: 3)
            }
        }
        
        self.backImg.addTap {
            self.setVCin(PC: previousIndex)
        }
    }

    func setupAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.bottomView.center.y -= self.bottomView.bounds.height
                        self.bottomView.layoutIfNeeded()
        }, completion: nil)
    }
}

extension TapBarViewController : UIPageViewControllerDataSource , UIPageViewControllerDelegate{
    
    func setVCin(PC index : Int){
        if let firstViewController : UIViewController = ExploresVC[index] {
            self.pageController?.setViewControllers([firstViewController],
                                                    direction: .forward,
                                                    animated: false,
                                                    completion: nil)
            self.setupIndicator(position:  index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let VCIndex = ExploresVC.index(of: viewController) else { return nil }
        let previousIndex = VCIndex - 1
        guard previousIndex >= 0 else {return ExploresVC.last}
        guard ExploresVC.count > previousIndex else {return nil}
        return ExploresVC[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let VCIndex = ExploresVC.index(of: viewController) else {
            return nil
        }
        let nextIndex = VCIndex + 1
        let orderVCCount = ExploresVC.count
        guard orderVCCount != nextIndex else { return ExploresVC.first }
        guard orderVCCount > nextIndex else { return nil }
        return ExploresVC[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.pendingIndex = ExploresVC.index(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if (completed)
        {
            self.currentIndex = self.pendingIndex!
            self.setupIndicator(position: self.currentIndex)
        }
    }
    
    func setupIndicator(position : Int){
        previousIndex = self.currentIndex
        self.currentIndex = position
        switch position {
            case 0:
                self.titleLbl.setText(Constants.string.getIn,fontStyle: .bold, isTitle: .yes, textColor: .black)
                self.searchImg.isHidden = false
                self.homeBGview.setCorneredElevation(shadow: 1, corner: 10, color: .gray)
                self.homeBGview.backgroundColor = .primary
                self.homeImg.setImage(.home, .yes, .white)
                self.homeBGview.isHidden = false
                [self.msgBgView,self.notificationBgView,self.profileBgView].forEach { (view) in
                    view?.isHidden  = true
                    
                    view?.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
                    view?.backgroundColor = .red
                }
            
                self.msgImg.setImage(.mail, .yes, .gray)
                self.notificationImg.setImage(.notification, .yes, .gray)
                self.profileImg.setImage(.user, .yes, .gray)
                Common().animateSelection(image: homeBGview)
            case 1:
                self.titleLbl.setText(Constants.string.message,fontStyle: .bold, isTitle: .yes, textColor: .black)
                self.msgBgView.setCorneredElevation(shadow: 1, corner: 10, color: .gray)
                self.msgBgView.backgroundColor = .primary
                self.msgBgView.isHidden = false
                 self.searchImg.isHidden = true
                self.msgImg.setImage(.mail, .yes, .white)
                [self.homeBGview,self.notificationBgView,self.profileBgView].forEach { (view) in
                    view?.isHidden  = true
                    view?.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
                    view?.backgroundColor = .red
                }
                
                self.homeImg.setImage(.home, .yes, .gray)
                self.notificationImg.setImage(.notification, .yes, .gray)
                self.profileImg.setImage(.user, .yes, .gray)
                Common().animateSelection(image: msgBgView)
            case 2:
               
                self.titleLbl.setText(Constants.string.notification,fontStyle: .bold, isTitle: .yes, textColor: .black)
                self.notificationBgView.setCorneredElevation(shadow: 1, corner: 10, color: .gray)
                self.notificationBgView.backgroundColor = .primary
                self.notificationBgView.isHidden = false
                self.searchImg.isHidden = true
                self.notificationImg.setImage(.notification, .yes, .white)
                [self.homeBGview,self.msgBgView,self.profileBgView].forEach { (view) in
                    view?.isHidden  = true
                    view?.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
                    view?.backgroundColor = .red
                }
                
                self.msgImg.setImage(.mail, .yes, .gray)
                self.homeImg.setImage(.home, .yes, .gray)
                self.profileImg.setImage(.user, .yes, .gray)
                Common().animateSelection(image: notificationBgView)
            case 3:
               
                self.titleLbl.setText(Constants.string.profile,fontStyle: .bold,isTitle: .yes, textColor: .black)
                self.profileBgView.setCorneredElevation(shadow: 1, corner: 10, color: .gray)
                self.profileBgView.backgroundColor = .primary
                self.profileBgView.isHidden = false
                self.searchImg.isHidden = true
                self.profileImg.setImage(.user, .yes, .white)
                [self.homeBGview,self.msgBgView,self.notificationBgView].forEach { (view) in
                    view?.isHidden  = true
                    view?.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
                    view?.backgroundColor = .red
                }
                
                self.msgImg.setImage(.mail, .yes, .gray)
                self.notificationImg.setImage(.notification, .yes, .gray)
                self.homeImg.setImage(.home, .yes, .gray)
                Common().animateSelection(image: profileBgView)
            
            default:
                print("News position")
        }
    }
    

    
}

extension TapBarViewController : PresenterOutputProtocol{
    func showSuccess(api: String, dataArray: [Mappable]?, dataDict: Mappable?, modelClass: Any) {
        
    }
    
    func showError(error: CustomError) {
        
    }
    
    
}
