//
//  ViewController.swift
//  SpreadSheet
//
//  Created by Rahul Chopra on 06/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import SpreadsheetView

class ViewController: UIViewController, SpreadsheetViewDataSource {
    
    @IBOutlet weak var spreadsheetView: SpreadsheetView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //spreadsheetView.dataSource = self
    }

    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 5
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 15
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        return 20
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        return 20
    }
    
    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 2
    }
    
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 2
    }

}

