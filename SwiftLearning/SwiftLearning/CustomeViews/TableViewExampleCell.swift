//
//  TableViewExampleCell.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 28/05/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit


class TableViewExampleCell: UITableViewCell {
    
     @IBOutlet weak var appName: UILabel?
     @IBOutlet weak var appPrice: UILabel?
     @IBOutlet weak var appImageView: UIImageView?
    
    var appDetailsViewModel: AppDetailViewModel! {
        didSet {
            appName?.text = appDetailsViewModel.appName
            appPrice?.text = appDetailsViewModel.price
            let urlString = appDetailsViewModel.appImageUrl
            let image = appDetailsViewModel.getImage(nameofImage: urlString!)
            if image == nil {
                let apiController = DownloadManager()
                apiController.imageforURL(imageURL: urlString!) { img in
                    DispatchQueue.main.async {
                        self.appDetailsViewModel.saveImage(nameofImage: urlString!, image: img)
                        self.appImageView?.image = img
                    }
                }
            } else {
                 self.appImageView?.image = image
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
