//
//  TestCodable.swift
//  SwiftLearning
//
//  Created by Subrat Kheti on 28/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation

struct testCodble: Codable {
    let name: String?
    let location: String?
    let followers: Int?
    let avatarUrl: URL?
    let repos: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case location
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
        
    }
}
