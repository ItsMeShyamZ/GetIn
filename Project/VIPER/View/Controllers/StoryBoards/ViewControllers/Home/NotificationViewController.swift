//
//  NotificationViewController.swift
//  Project
//
//  Created by AppleMac on 19/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var notificationTable : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialLoad()
    }
    
}
extension NotificationViewController{
    func initialLoad(){
        self.setupView()
        self.setupTableView()
    }
    func setupView(){
    }
    
    
}


extension NotificationViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.Ids.NotificationCell, for: indexPath) as! NotificationCell
        
        return cell
    }
    
    func setupTableView(){
        self.notificationTable.delegate = self
        self.notificationTable.dataSource = self
        self.notificationTable.registerCell(withId:TableView.Ids.NotificationCell)
    }
}
