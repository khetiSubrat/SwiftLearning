//
//  AppDetails.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 07/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class AppDetail {
    
    var price: String?
    var thumbnailURLString: String?
    var appName: String?
    var appImageUrl: String?
    
    init(price: String, thumbnailURLString:String, appName: String, appImageUrl: String) {
        self.price = price
        self.thumbnailURLString = thumbnailURLString
        self.appName = appName
        self.appImageUrl = appImageUrl
    }
}

class APIResult {
    var appDetails = [AppDetail]()
    
    init(results: Array<Any>) {
        for result in results {
            let r  = result as? NSDictionary
            if let thumbnailURLString = r?["artworkUrl100"] as? String,
                let appName = r?["trackName"] as? String,
                let appImageUrl = r?["artworkUrl60"] as? String,
                let price = r?["formattedPrice"] as? String {
                let appDetail = AppDetail.init(price: price,
                                                thumbnailURLString: thumbnailURLString,
                                                appName: appName,
                                                appImageUrl: appImageUrl)
               self.appDetails.append(appDetail)
            }
        }
    }
}


class appDetail1: Codable {
    let artworkUrl100: String
    let trackName: String
    let artworkUrl60: String
    let formattedPrice: String
}
