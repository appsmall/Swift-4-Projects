//
//  CoreData.swift
//  TagViewInTextField
//
//  Created by Rahul Chopra on 07/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import CoreData

class CoreData
{
    
    static func saveData(arrNumber: Data)
    {
        
        let person = Person(context: context)
        
        person.numbersArray = arrNumber
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    static func fetchData() {
        do {
            task = try context.fetch(Person.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
}
