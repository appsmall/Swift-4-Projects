//
//  ViewController.swift
//  ChatAppFirebase
//
//  Created by Rahul Chopra on 20/09/17.
//  Copyright © 2017 UncleBar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtUName: UITextField!
    @IBOutlet weak var txtUPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButton_clicked(_ sender: Any)
    {
      //  let email = "test1@email.com"
      //  let password = "opened"
        let email: String? = txtUName.text
        let password: String? = txtUPassword.text
        
        
        let users = [User]()
        print(users)
        
        FirebaseManager.Login(email: email!, password: password!) { (success:Bool) in
            if(success) {
                self.performSegue(withIdentifier: "showProfile", sender: self);
            }
            else {
                print("Error")
                let alert = UIAlertController.init(title: "Warning", message: "You entered wrong fields", preferredStyle: .alert)
                let actionOK = UIAlertAction.init(title: "OK", style: .default, handler: nil)
                alert.addAction(actionOK)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
    }

}

