//
//  Constants.swift
//  UserSelectionShowVisitorCoreData
//
//  Created by Rahul Chopra on 26/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import UIKit


let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext

var user: [Users] = []
var visitor: [Visitors] = []

var filterVisitor: [Visitors] = []



var lastSavedUID = Int16()
var lastSavedVID = Int16()
var lastsaved_UID2: Bool = false
