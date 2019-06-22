//
//  ViewController.swift
//  TextField
//
//  Created by Rahul Chopra on 23/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tField.delegate = self
    }

    
    //Function Used to set the limits of characters and numbers in the Text Field.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        let currentText = tField.text ?? ""
        guard let stringRange = Range(range, in:currentText) else {
            return false
        }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        // Change limit based on your requirement.
        return updatedText.count <= 3
    }


}

