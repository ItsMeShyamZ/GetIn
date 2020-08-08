//
//  MessageViewController.swift
//  Project
//
//  Created by AppleMac on 18/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    
    @IBOutlet weak var messageTable : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialLoad()
    }
    
}
extension MessageViewController{
    func initialLoad(){
        self.setupView()
        self.setupTableView()
    }
    func setupView(){
    }
    
    
}


extension MessageViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.Ids.MessageCell, for: indexPath) as! MessageCell
        
        return cell
    }
    
    func setupTableView(){
        self.messageTable.delegate = self
        self.messageTable.dataSource = self
        self.messageTable.registerCell(withId:TableView.Ids.MessageCell)
    }
}
