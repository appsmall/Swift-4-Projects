//
//  VisitorData.swift
//  UserSelectionShowVisitorCoreData
//
//  Created by Rahul Chopra on 26/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class VisitorData: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setRightBarButton(UIBarButtonItem.init(title: "Show Data", style: .done, target: self, action: #selector(btnShow)), animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        Visitor.fetchData()
        print("User Details are: \(user)")
        print("Visitor Details are: \(visitor)")
    }

    @IBAction func btnAdd(_ sender: Any)
    {
        if tfEmail.text != "" && tfName.text != ""
        {
            if visitor.count == 0
            {
                lastSavedVID = 1
                Visitor.saveData(strName: tfName.text!, strEmail: tfEmail.text!, id: lastSavedVID, user_id: lastSavedUID)
            }
            else
            {
                let vis = visitor[visitor.count - 1]
                let visID = vis.id
                let savedVisID = visID + 1
                lastSavedVID = savedVisID
                
                Visitor.saveData(strName: tfName.text!, strEmail: tfEmail.text!, id: savedVisID, user_id: lastSavedUID)
                
            }
        }
        else {
            let alert = UIAlertController.init(title: "", message: "Please enter email and name", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func btnShow()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowData") as! ShowTableData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
