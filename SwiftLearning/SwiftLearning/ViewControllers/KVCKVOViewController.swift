//
//  KVCKVOViewController.swift
//  SwiftLearning
//
//  Created by Subrat Kheti on 03/09/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class KVCKVOViewController: UIViewController {
    //var child:Children!
    var childViewModel = ChildrenViewModel(childModel: Children())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = childViewModel.observe(\ChildrenViewModel.name, options: [.old, .new],
                                                   changeHandler: {  (_, change) in
            print("something is changed")
        })
        
        change()
        
    }

    override func observeValue(forKeyPath keyPath: String?,
                                        of object: Any?,
                                           change: [NSKeyValueChangeKey : Any]?,
                                          context: UnsafeMutableRawPointer?) {
        if keyPath == "name" {
            print("Update the value")
            print(change![NSKeyValueChangeKey.newKey] as! String)
            print(change![NSKeyValueChangeKey.oldKey] as! String)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func change() {
        self.childViewModel.updateEmailTextValue("hello")
    }
}
