//
//  ViewController.swift
//  Alamofire&SwiftyJSON
//
//  Created by Rahul Chopra on 04/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myResponse: JSON!
    
    var userData: [User] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let url = URL(string: FETCH_USER_URL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request).responseJSON { response in
            
            switch response.result
            {
            case .success(let data):
                //print("Data grabbed successfully: \(data)")
                
                self.myResponse = JSON(data)
                //print("OKAY \(self.myResponse)")
                
                
                
                for i in 0..<self.myResponse.count {
                    let singleUser = User(userJSON: self.myResponse[i])
                    self.userData.append(singleUser)
                }
                self.tableView.reloadData()
                
            case .failure(let error):
                    print("Error here: \(error)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let myUser = self.userData[indexPath.row]
        
        print("IMAGE \(myUser.thumbnailUrl)")
        
        let urlImg: URL = URL(string: myUser.thumbnailUrl)!
        
        do {
            let imageData = try Data(contentsOf: urlImg as URL)
            cell.imgShow.image = UIImage.init(data: imageData)
        } catch {
            print("Unable to load data: \(error)")
        }
        
        
        cell.lblTitle.text = myUser.title
        
        
        return cell
    }


}

