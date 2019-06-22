//
//  ViewController.swift
//  AlamoFireWebAPI
//
//  Created by Rahul Chopra on 02/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myResponse: JSON!
    var users: [User] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //let url: URL = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let url:
            URL = URL(string: "http://www.digientry.com/laravel_api_demo/api/demoapi")!
        
        var request = URLRequest(url: url as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request).responseJSON { response in
            
            switch response.result
            {
                case .success(let data):
                    print("Successfully grabbed response :\(data)")
                
                    self.myResponse = JSON(data)
                    for i in 0..<self.myResponse.count
                    {
                        
                        
                        let singleUser = User(userJSON: self.myResponse[i])
                        self.users.append(singleUser)
                        
                    }
                    self.tableView.reloadData()
                
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
        
        
        
        
        
        
        
        
        let parameters = ["id": 13, "name": "jack"] as [String : Any]
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request1 = URLRequest(url: url)
        request1.httpMethod = "POST" //set http method as POST
        
        do {
            request1.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request1.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request1.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request1 as URLRequest, completionHandler: { data, response, error in
            
            print(response)
            
            guard error == nil else {
                
                
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print("POST Method :\(json)")
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
        
        
        
        
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        print("OK")
        let myUser = self.users[indexPath.row]
        print("OK1")
        
        cell.name.text = myUser.name
        cell.uName.text = myUser.uname
        cell.email.text = myUser.email
        cell.phone.text = myUser.phone
        cell.compName.text = myUser.company.companyName
        cell.phrase.text = myUser.company.phrase
        
        print("OK2")
        
        return cell
    }


}

