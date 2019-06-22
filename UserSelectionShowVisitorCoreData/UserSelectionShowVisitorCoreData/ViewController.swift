//
//  ViewController.swift
//  UserSelectionShowVisitorCoreData
//
//  Created by Rahul Chopra on 26/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        User.fetchData()
    }

    @IBAction func btnLogin(_ sender: Any)
    {
        if tfEmail.text != "" && tfPwd.text != ""
        {
            if lastsaved_UID2 == false
            {
                print("Check Email Address and Pwd from Local DB")
                
                if user.count != 0 {
                    for i in 0..<user.count
                    {
                        let usr = user[i]
                        
                        print("Data is : \(usr.email, usr.password)")
                        
                        if tfEmail.text == usr.email && tfPwd.text == usr.password
                        {
                            
                            print("here")
                            
                            lastSavedUID = usr.id
                            print("Login and when it has some objects : \(lastSavedUID)")
                            
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "VisitorData") as! VisitorData
                            self.navigationController?.pushViewController(vc, animated: true)
                            return
                        }
                        
                        if i == (user.count - 1)
                        {
                            lastsaved_UID2 = true
                            self.aa()
                        }
                    }
                }
                else {
                    lastsaved_UID2 = true
                    self.aa()
                }
            }
            else
            {
                
                print("False Email Address and Pwd from Local DB")
                lastsaved_UID2 = true
                self.aa()
            }
            
        }
        
            
        else {
            let alert = UIAlertController.init(title: "", message: "Please enter email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func aa() {
        if lastsaved_UID2 == true
        {
            print("Entered Here")
            if user.count == 0
            {
                lastSavedUID = 1
                User.saveData(strPwd: self.tfPwd.text!, strEmail: self.tfEmail.text!, id: lastSavedUID)
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "VisitorData") as! VisitorData
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                let usr = user[user.count - 1]
                let lastObectUID = Int16(usr.id)
                let savedID = lastObectUID + 1
                
                //Save Data
                User.saveData(strPwd: self.tfPwd.text!, strEmail: self.tfEmail.text!, id: savedID)
                lastSavedUID = savedID
                print("Not Login and when it has some objects : \(lastSavedUID)")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "VisitorData") as! VisitorData
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
    
    @IBAction func btnSignup(_ sender: Any)
    {
        if tfEmail.text != nil && tfPwd.text != nil
        {
            if user.count == 0
            {
                let savedID = 1
                //Save Data
                User.saveData(strPwd: self.tfPwd.text!, strEmail: self.tfEmail.text!, id: Int16(savedID))
                lastSavedUID = Int16(savedID)
            }
            else
            {
                let usr = user[user.count - 1]
                let lastObectUID = Int16(usr.id)
                let savedID = lastObectUID + 1
                
                //Save Data
                User.saveData(strPwd: self.tfPwd.text!, strEmail: self.tfEmail.text!, id: savedID)
                lastSavedUID = savedID
            }
        }
    }
    
    
}

