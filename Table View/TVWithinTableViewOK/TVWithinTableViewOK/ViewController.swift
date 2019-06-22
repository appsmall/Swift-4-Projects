//
//  ViewController.swift
//  TVWithinTableViewOK
//
//  Created by Rahul Chopra on 05/02/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

var arrHeader: [String] = ["1","2","3","4","5","6"]
var arrSubheader: [String] = ["11","22","33","44","55","66"]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var dTVHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.mainTV.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height = min(self.view.bounds.size.height, mainTV.contentSize.height)
        dTVHeight.constant = height
        
        self.view.sizeThatFits(CGSize(width: self.view.frame.size.width, height: height))
        
        self.view.layoutIfNeeded()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 100
        {
            return arrHeader.count
        }
        else
        {
            return arrSubheader.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView.tag == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
            
            cell.lblHeader.text = arrHeader[indexPath.row]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsideCell", for: indexPath) as! InsideTableViewCell
            
            cell.textLabel?.text = arrSubheader[indexPath.row]
            
            return cell
        }
    }

}



