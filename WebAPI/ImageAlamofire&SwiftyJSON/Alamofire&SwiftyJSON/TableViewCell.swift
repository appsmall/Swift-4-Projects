//
//  TableViewCell.swift
//  Alamofire&SwiftyJSON
//
//  Created by Rahul Chopra on 04/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgShow: UIImageView!
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
