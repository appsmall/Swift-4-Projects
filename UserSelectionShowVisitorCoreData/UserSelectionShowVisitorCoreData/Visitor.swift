//
//  Visitor.swift
//  UserSelectionShowVisitorCoreData
//
//  Created by Rahul Chopra on 26/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Visitor {
    
    static func saveData(strName: String, strEmail: String, id: Int16, user_id: Int16)
    {
        let visDetail = Visitors(context: context)
        visDetail.name = strName
        visDetail.email = strEmail
        visDetail.id = id
        visDetail.user_id = user_id
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    static func fetchData()
    {
        do {
            visitor = try context.fetch(Visitors.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    static func filterUserID() -> [Visitors]?
    {
        
        let fetchRequest: NSFetchRequest<Visitors> = Visitors.fetchRequest()
        
        var visitor: [Visitors]? = nil
        
        let predicate = NSPredicate(format: "user_id = %d", lastSavedUID)
        fetchRequest.predicate = predicate
        
        do {
            visitor = try context.fetch(fetchRequest)
            return visitor
        }
        catch {
            return visitor
        }
    }
}
