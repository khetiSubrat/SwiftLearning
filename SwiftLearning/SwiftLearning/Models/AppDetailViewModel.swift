//
//  AppDetailsViewModel.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 23/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class AppDetailViewModel {
    
    var price: String?
    var thumbnailURLString: String?
    var appName: String?
    var appImageUrl: String?
    
    var downloadImages = [String: UIImage]()
    
    init(appDetail: AppDetail) {
        price = appDetail.price
        thumbnailURLString = appDetail.thumbnailURLString
        appName = appDetail.appName
        appImageUrl =  appDetail.appImageUrl
    }
    
    func saveImage(nameofImage: String, image:UIImage) {
        self.downloadImages[nameofImage] = image
    }
    
    func getImage(nameofImage: String)->UIImage? {
        guard let image = self.downloadImages[nameofImage] else { return nil }
        return image
    }

}
