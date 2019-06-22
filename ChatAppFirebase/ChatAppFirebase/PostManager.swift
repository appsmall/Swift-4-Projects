//
//  PostManager.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 21/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PostManager: NSObject {
    
    static let databaseRef = Database.database().reference()
    static var posts = [Post]()
    
    static func fillPosts(uid:String?, toID:String, completion: @escaping (_ result:String) -> Void) {
        
        posts = []
        let allPost = databaseRef.child("posts")
        print(allPost)
        let post = databaseRef.child("posts").queryOrdered(byChild: "uid").queryEqual(toValue: FirebaseManager.currentUser?.uid).observe(.childAdded, with: {
            snapshot in
            print("snapshot \(snapshot)")
        })
        
        databaseRef.child("posts").queryOrdered(byChild: "uid").queryEqual(toValue: FirebaseManager.currentUser?.uid).observe(.childAdded, with: { snapshot in
            print(snapshot)
            if let result = snapshot.value as? [String:AnyObject] {
                let toIDCloud = result["toID"]! as! String
                if(toIDCloud == toID) {
                    
                    let p = Post(username: result["username"]! as! String, text: result["text"]! as! String, toID: result["toID"]! as! String)
                    PostManager.posts.append(p)
                    
                }
            }
            completion("")
        })
        
    }
    
}

class Post {
    var username: String = ""
    var text: String = ""
    var toID: String = ""
    
    init(username:String, text:String, toID:String) {
        self.username = username
        self.text = text
        self.toID = toID
    }
}
