//
//  TableViewExampleController.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 28/05/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class TableViewExampleController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let iTuneSearchWord = "Angry Birds"
    var appDetailsModel = [AppDetailViewModel]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "TableViewExampleCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        fetchDatafromService()
    }
    
    func fetchDatafromService() {
        let apiController = DownloadManager()
        apiController.searchiTune(searchTerm: iTuneSearchWord) { (result: APIResult) -> (Void) in
            self.appDetailsModel = result.appDetails.map({return AppDetailViewModel(appDetail: $0)})
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int  {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appDetailsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewExampleCell
        let test = self.appDetailsModel[indexPath.row]
        cell.appDetailsViewModel = test
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Button clicked", indexPath.row)
    }
}
