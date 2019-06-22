//
//  HomeViewController.swift
//  PushImage
//
//  Created by Rahul Chopra on 13/10/17.
//  Copyright © 2017 learn2ios. All rights reserved.
//

import Cocoa

class HomeViewController: NSViewController {
    
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var staticLabel: NSTextField!
    @IBOutlet weak var loadingSpinner: NSProgressIndicator!
    @IBOutlet weak var dragView: DargView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

