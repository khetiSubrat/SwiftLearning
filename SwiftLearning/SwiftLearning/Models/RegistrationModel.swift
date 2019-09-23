//
//  RegistrationModel.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 24/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation

struct Registration {
    
    init(value: String) {
        self.emailValue = value
    }
    
    var emailValue: String? {
        didSet {
            print("emailValue")
        }
    }
}
