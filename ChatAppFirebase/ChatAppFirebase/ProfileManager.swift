//
//  ProfileManager.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 22/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ProfileManager: NSObject {
    
    static let databaseRef = Database.database().reference()
    static let uid = Auth.auth().currentUser?.uid
    
    static var users = [User]()
    
    
    static func getCurrentUser(uid:String) -> User? {
        
        if let i = users.index(where: {$0.uid == uid}) {
            return users[i]
        }
        return nil
    }
    
    static func fillUser(completion: @escaping () -> Void) {
        users = []
        databaseRef.child("users").observe(.childAdded, with: {
            snapshot in
            print(snapshot)
            if let result = snapshot.value as? [String:AnyObject] {
                let uid = result["uid"]! as! String
                let username = result["username"]! as! String
                let email = result["email"]! as! String
                let profileImgURL = result["profileImgURL"]! as! String
                
                let u = User(uid: uid, username: username, email: email, profileImgUrl: profileImgURL)
                
                ProfileManager.users.append(u)
            }
            completion()
        })
    }

}
