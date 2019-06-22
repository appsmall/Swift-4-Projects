//
//  User.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 22/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var username: String
    var email: String
    var uid: String
    var profileImgURL: String
    
    init(uid:String, username:String, email:String, profileImgUrl:String) {
        self.uid = uid
        self.username = username
        self.email = email
        self.profileImgURL = profileImgUrl
    }
    
    

}
