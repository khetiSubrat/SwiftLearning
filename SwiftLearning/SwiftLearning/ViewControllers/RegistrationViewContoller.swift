//
//  ObserverViewController.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 24/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class RegistrationViewContoller: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var registrationViewModel: RegistrationViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registrationViewModel = RegistrationViewModel(reg:Registration(value: "") )
        observeViewModel()
        // Do any additional setup after loading the view.
    }

    func observeViewModel() {
        self.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {
        //self.registrationViewModel.updateEmailTextValue(self.emailTextField.text ?? "")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
