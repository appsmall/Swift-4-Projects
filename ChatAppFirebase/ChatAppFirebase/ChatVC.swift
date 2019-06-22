//
//  ChatVC.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 20/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        PostManager.fillPosts(uid: FirebaseManager.currentUser?.uid, toID: (selectedUser?.uid)!) { (result:String) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        PostManager.posts = []
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PostManager.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! chatTVC
        
        let chatText = cell.chatText
        chatText?.delegate = self as? UITextViewDelegate
        let post = PostManager.posts[indexPath.row]
        cell.chatText?.text = post.text
        
        
        
        return cell
    }

}

extension chatTVC: UITextViewDelegate {
    
}
