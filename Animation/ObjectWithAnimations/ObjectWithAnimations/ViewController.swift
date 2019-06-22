//
//  ViewController.swift
//  ObjectWithAnimations
//
//  Created by Rahul Chopra on 17/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchOtl: UIButton!
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.alpha = 0
        self.searchBar.frame = CGRect(x: 325, y: 16, width: self.view.frame.size.width, height: self.searchOtl.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSearch(_ sender: Any)
    {
        
        searchBar.searchBarStyle = .default
        self.view.addSubview(searchBar)
        
        var anim = UIView.animate(withDuration: 1) {
            self.searchBar.alpha = 1.0
            self.searchBar.frame = CGRect(x: 16, y: 16, width: self.view.frame.size.width, height: self.searchOtl.frame.height)
            
        }
        
        
    }
    
}

