//
//  ShowTableData.swift
//  UserSelectionShowVisitorCoreData
//
//  Created by Rahul Chopra on 26/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import CoreData

class ShowTableData: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButton(UIBarButtonItem.init(title: "Logout", style: .done, target: self, action: #selector(btnLogout)), animated: true)

        tableView.dataSource = self
        tableView.delegate = self
        
        print("Selected UID : \(lastSavedUID)")
        
        filterVisitor = Visitor.filterUserID()!
        
        
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        filterVisitor = Visitor.filterUserID()!
        
        
        Visitor.fetchData()
        User.fetchData()
        self.tableView.reloadData()
    }
    
    @objc func btnLogout() {
        lastSavedUID = 0
        lastSavedVID = 0
        
        lastsaved_UID2 = false
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterVisitor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let filterVis = filterVisitor[indexPath.row]
        
        cell.textLabel?.text = filterVis.name
        cell.detailTextLabel?.text = filterVis.email
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}
