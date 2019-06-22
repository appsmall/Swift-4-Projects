//
//  userData.swift
//  Alamofire&SwiftyJSON
//
//  Created by Rahul Chopra on 04/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

import Foundation
import SwiftyJSON

class User{

    var title: String
    var thumbnailUrl: String
    
    init(userJSON: JSON) {
        self.title = userJSON["title"].stringValue
        self.thumbnailUrl = userJSON["thumbnailUrl"].stringValue
    }
}
