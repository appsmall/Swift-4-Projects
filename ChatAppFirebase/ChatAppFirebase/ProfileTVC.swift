//
//  ProfileTVC.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 20/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewController {

    var selectedUser: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.reloadData()
        ProfileManager.fillUser { 
            () in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return ProfileManager.users.count
        return ProfileManager.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        let u = ProfileManager.users[indexPath.row]
        
        //cell.textLabel?.text = "test "
        cell.textLabel?.text = u.username
        

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedUser = ProfileManager.users[indexPath.row]
        self.performSegue(withIdentifier: "showChat", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChat",
            let destinationVC = segue.destination as? ChatVC {
            destinationVC.selectedUser = selectedUser
        }
        else if segue.identifier == "showSettings",
            let destinationVC = segue.destination as? SettingsVC {
            //aaa
           // destinationVC.selectedUser = selectedUser
        }
    }

}
