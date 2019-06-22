//
//  User.swift
//  UserSelectionShowVisitorCoreData
//
//  Created by Rahul Chopra on 26/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class User {
    
    static func saveData(strPwd: String, strEmail: String, id: Int16)
    {
        let user = Users(context: context)
        user.password = strPwd
        user.email = strEmail
        user.id = id
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    static func fetchData()
    {
        do {
            user = try context.fetch(Users.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
}
