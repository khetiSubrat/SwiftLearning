//
//  ChildrenViewModel.swift
//  SwiftLearning
//
//  Created by Subrat Kheti on 03/09/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation

class ChildrenViewModel:NSObject {
    @objc dynamic var name:String
    @objc dynamic var age: Int
    
    private let child =  Children()
    
        init(childModel: Children) {
            self.name = childModel.name
            self.age = childModel.age
            
            super.init()
             NotificationCenter.default.addObserver(forName: NSNotification.Name("valueDidChange"),
                                                              object: nil,
                                                              queue: nil) { (note) in
                _ = note.userInfo
                self.name = "hello"
            }
            
        
    }
    func updateEmailTextValue(_ value: String) {
        self.child.name = value
    }
    
}
