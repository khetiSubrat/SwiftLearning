//
//  ViewController.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 27/05/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterButtonClick() {
        let mainViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}

