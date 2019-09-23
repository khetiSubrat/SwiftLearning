//
//  CustomTableViewCell.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 28/05/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
