//
//  ResgistrationViewModel.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 24/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation

class RegistrationViewModel {
    var emailViewValue: String
    
    init(reg: Registration) {
        emailViewValue = reg.emailValue ?? ""
    }
    
    func updateEmailTextValue(value: String) {
        
    }
}
