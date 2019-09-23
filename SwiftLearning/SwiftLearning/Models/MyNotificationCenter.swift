//
//  MyNotificationCenter.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 14/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class MyNotificationCenter: NSObject {
    
    static let shared = MyNotificationCenter()
    private override init() { }
    
    var dict = [String: ()->()]()
    
    func addObserverforKey(name: String, closure:@escaping ()->()) {
        dict[name] = closure
    }
    
    func postNotificationforKey(name: String) {
        guard let fun = dict[name] else {
            return
            
        }
        fun()
    }
   
}
