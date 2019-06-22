//
//  AddToDoVC.swift
//  ToDoApp with CoreData
//
//  Created by Rahul Chopra on 24/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import CoreData

class AddToDoVC: UIViewController, UITextViewDelegate {
    
    var managedContext: NSManagedObjectContext!

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var segmCtrl: UISegmentedControl!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(with:)), name: .UIKeyboardWillShow, object: nil)
        
        textView.becomeFirstResponder()
        
        textView.delegate = self
    }
    
    @objc func keyboardWillShow(with notification:Notification)
    {
        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        bottomConstraint.constant = keyboardHeight + 16
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func btnAdd(_ sender: Any)
    {
        guard let title = textView.text, !title.isEmpty else {
            return
        }
        
        let todo = Todo(context: managedContext)
        todo.title = title
        todo.priority = Int16(segmCtrl.selectedSegmentIndex)
        todo.date = Date()
        
        do {
            try managedContext.save()
            dismiss(animated: true)
            textView.resignFirstResponder()
        }
        catch {
            print("Error saving todo: \(error)")
        }
    }
    
    @IBAction func btnCancel(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
        textView.resignFirstResponder()
    }
    
    func textViewDidChangeSelection(_ textView: UITextView)
    {
        if doneButton.isHidden {
            textView.text.removeAll()
            textView.textColor = .white
            print("OK")
            doneButton.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

