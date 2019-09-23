//
//  Children.swift
//  SwiftLearning
//
//  Created by Subrat Kheti on 03/09/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation


class Children: NSObject {
    
    override init() {
        self.name = ""
        self.age = 0
    }
    
    var name: String = "" {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name("valueDidChange"), object: self, userInfo: [self.name:name])
        }
    }
    var age: Int = 0 {
        didSet {
           // NotificationCenter.default.post(name: NSNotification.Name("valueDidChange"), object: self, userInfo: [self.name:name])
        }
    }
    
    
}
