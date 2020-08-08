//
//  Identifiers.swift
//  User
//
//  Created by imac on 12/19/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import Foundation

// MARK:- Storyboard Id
struct Storyboard {
    
    static let Ids = Storyboard()
    let DrawerController = "DrawerController"
    let HomeVC = "HomeViewController"
    let LaunchViewController = "LaunchViewController"
    let TapBarVC = "TapBarViewController"
    let messageVC = "MessageViewController"
    let NotifyVC = "NotificationViewController"
    let ProfileVC = "ProfileViewController"
    let creatPostVC = "CreatePostViewController"
    let postDetailVC = "PostDetailViewController"
    let SinginViewController = "SinginViewController"
    
}

struct TableView {
    
    static let Ids = TableView()
    let PostCell = "PostCell"
    let MessageCell = "MessageCell"
    let NotificationCell = "NotificationCell"
    let MyPostCell = "MyPostCell"
    
}

struct CustomView {
    static let ProfileHeaderView = "ProfileHeaderView"
}


public enum storyboardName : String{
    case main = "Main"
    case home = "Home"
    
}


//MARK:- XIB Cell Names

struct XIB {
    
    static let Names = XIB()
}


//MARK:- Notification

extension Notification.Name {
   //public static let reachabilityChanged = Notification.Name("reachabilityChanged")
}



