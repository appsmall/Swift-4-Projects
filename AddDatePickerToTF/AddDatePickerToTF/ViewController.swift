//
//  ViewController.swift
//  AddDatePickerToTF
//
//  Created by Rahul Chopra on 23/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tField = UITextField()
    var datePicker = UIDatePicker()
    var toolBar = UIToolbar()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        createToolBar()
        addTextField()
        tField.inputAccessoryView = toolBar
        
        tField.inputView = datePicker
    }

    func addTextField()
    {
        view.addSubview(tField)
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tField.placeholder = "Select Date"
        tField.borderStyle = .roundedRect
    }
    
    func createDatePicker()
    {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(datePicker:)), for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        tField.text = dateFormatter.string(from: datePicker.date)
    }
    
    func createToolBar() {
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        let todayButton = UIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(todayButtonPressed(sender:)))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed(sender:)))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: 40))
        label.text = "Choose your Date"
        let labelButton = UIBarButtonItem(customView:label)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.setItems([todayButton,flexibleSpace,labelButton,flexibleSpace,doneButton], animated: true)
    }

    @objc func todayButtonPressed(sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter() // 1
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        tField.text = dateFormatter.string(from: Date()) // 2
        
        tField.resignFirstResponder()
    }
    
    @objc func doneButtonPressed(sender: UIBarButtonItem) {
        tField.resignFirstResponder()
    }

}

