//
//  ItemTableViewCell.swift
//  ToDoListApp
//
//  Created by iMac03 on 2017-10-16.
//  Copyright © 2017 iMac03. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var nameLabel: UILabel!
    
}
