//
//  BackGroundDownloadViewController.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 26/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

class BackGroundDownloadViewController: UIViewController, downloadComplet {
   
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var percentage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }

    @IBAction func startDownLoading(_sender: UIButton) {
        let url = URL(string: "https://scholar.princeton.edu/sites/default/files/oversize_pdf_test_0.pdf")!
        let downLoadManager = DownloadManager.shared
        downLoadManager.delegate = self
        downLoadManager.createDownloadTask().downloadTask(with: url).resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateUI() {
        DispatchQueue.main.async {
             self.progressLabel.text = "Download Complet"
        }
    }
    
    func updateProgressBar(progress: Float) {
        DispatchQueue.main.async {
            self.progressBar.progress = progress
            let val = Int(progress * 100)
            self.percentage.text = String(val) + "%"
        }
    }

}
