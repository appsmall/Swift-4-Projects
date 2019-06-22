//
//  File.swift
//  AlamoFireWebAPI
//
//  Created by Rahul Chopra on 03/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    var name : String
    var uname : String
    var email : String
    var phone : String
    var address : UserAddress
    var company : UserCompany
    
    init(userJSON : JSON) {
        self.name = userJSON["name"].stringValue
        self.uname = userJSON["username"].stringValue
        self.phone = userJSON["phone"].stringValue
        self.email = userJSON["email"].stringValue
        
        self.address = UserAddress(addressJSON:userJSON["address"])
        self.company = UserCompany(companyJSON:userJSON["company"])
    }
    
}

class UserAddress {
    
    var street : String
    var city : String
    
    init(addressJSON: JSON) {
        
        self.street = addressJSON["street"].stringValue
        self.city = addressJSON["city"].stringValue
    }
}

class UserCompany {
    
    var companyName : String
    var phrase : String
    
    init(companyJSON: JSON) {
        
        self.companyName = companyJSON["name"].stringValue
        self.phrase = companyJSON["catchPhrase"].stringValue
    }
}
