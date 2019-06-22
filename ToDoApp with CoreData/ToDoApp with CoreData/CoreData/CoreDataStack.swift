//
//  CoreDataStack.swift
//  ToDoApp with CoreData
//
//  Created by Rahul Chopra on 24/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    var container: NSPersistentContainer
    {
        let container = NSPersistentContainer(name: "Todos")
        container.loadPersistentStores { (description, error) in
            
            guard error == nil else {
                print("Error \(error!)")
                return
            }
        }
        
        return container
    }
    
    
    var managedObject: NSManagedObjectContext
    {
        return  container.viewContext
    }
    
    
}
