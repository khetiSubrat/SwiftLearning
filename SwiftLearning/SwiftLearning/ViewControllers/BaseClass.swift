//
//  BaseClass.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 12/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation
import UIKit

protocol BaseClassMethod {
    func printDetails()
}

extension BaseClassMethod where Self: MainViewController {
    func printDetails()  {
        print("I m in main class")
    }
}
