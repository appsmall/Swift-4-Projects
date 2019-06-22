//
//  MainTableViewCell.swift
//  TVWithinTableViewOK
//
//  Created by Rahul Chopra on 05/02/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var insideTV: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MainTableViewCell
{
    func setTableViewDataSourceDelegate
        <D: UITableViewDelegate & UITableViewDataSource>
        (_ dataSourceDelegate: D, forRow row: Int)
    {
        insideTV.delegate = dataSourceDelegate
        insideTV.dataSource = dataSourceDelegate
        
        insideTV.reloadData()
    }
}
