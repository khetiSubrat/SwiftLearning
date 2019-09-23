//
//  MainViewController.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 27/05/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, BaseClassMethod  {
    
    @IBOutlet var tableView: UITableView!
    var listOfModules: [String] = ["TableView", "CollectionView", "CoreData", "DispatchQueue", "NSOperation", "ViewControllers", "Notification", "POP", "Observer", "BackGroundDownload", "KVC & KVO"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    deinit {
        print("remove from controller")
        
        
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

func hackerrankInString(s: String) -> String {
    let targetString = "hackerrank"
    var j = 0
    for index in 0..<s.count - 1 {
        let str = s.index(s.startIndex, offsetBy: index)
        if str == targetString.index(targetString.startIndex, offsetBy: j) {
            j = j + 1
        }
    }
    if j == targetString.count {
        return "YES"
    }
    
    return "NO"
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int  {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfModules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.label?.text = self.listOfModules[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController: UIViewController?
        if  indexPath.row == 0 {
            viewController = TableViewExampleController(nibName: "TableViewExampleController", bundle: nil)
        } else if indexPath.row == 9 {
            viewController = BackGroundDownloadViewController(nibName: "BackGroundDownloadViewController", bundle: nil)
        } else if indexPath.row == 2 {
        } else if indexPath.row == 10 {
            viewController = KVCKVOViewController(nibName: "KVCKVOViewController", bundle: nil)
        }
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
}
