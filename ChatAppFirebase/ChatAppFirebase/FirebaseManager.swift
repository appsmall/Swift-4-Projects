//
//  FirebaseManager.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 21/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class FirebaseManager: NSObject
{
    static let databaseRef = Database.database().reference()
    static var currentUID: String = ""
    static var currentUser: User? = nil
    
    static func Login(email:String, password:String, completion: @escaping (_ success:Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            }
            else {
                //currentUser = user
                currentUID = (user?.uid)!
                print(currentUID)
                completion(true)
            }
        }
    }

}
