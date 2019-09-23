//
//  DownloadManager.swift
//  SampleTableView
//
//  Created by Subrat Kheti on 26/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import UIKit

protocol downloadComplet:class {
    func updateUI()
    func updateProgressBar(progress:Float)->()
}

class DownloadManager:NSObject {
    
    static var shared =  DownloadManager()
    weak var delegate: downloadComplet?
    var progressCounter:Float = 0.0
    
    func createDownloadTask()->URLSession {
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
        config.sessionSendsLaunchEvents = true
        // Warning: If an URLSession still exists from a previous download, it doesn't create a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
    }
    
    func imageforURL(imageURL: String, completion:@escaping (_ img: UIImage)->Void) {
        URLSession.shared.dataTask(with: URL(string: imageURL)!) { (data, response, error) in
            if let error = error {
                print(error)
            } else {
                let image = UIImage(data: data!)
                completion(image!)
            }
        }.resume()
    }
    
    func searchiTune(searchTerm: String, withCompletion:@escaping (APIResult)->(Void)) -> Void {
        let iTuneSearchTerm = searchTerm.replacingOccurrences(of: "", with: "+")
        let escapedSearchTerm = iTuneSearchTerm.addingPercentEncoding(withAllowedCharacters: [])!
        
        let urlString = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, respone, error) in
            if let error = error {
                print(error)
            } else {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                    if let results: NSArray = jsonResult["results"] as? NSArray {
                        let result = APIResult.init(results: results as! Array<Any>)
                        withCompletion(result)
                    }
                }
                catch let err {
                    print(err.localizedDescription)
                }
            }
            
            }.resume()
    }
    
    func codable(serachTerm:String) {
        let iTuneSearchTerm = serachTerm.replacingOccurrences(of: "", with: "+")
        let escapedSearchTerm = iTuneSearchTerm.addingPercentEncoding(withAllowedCharacters: [])!
        
        let urlString = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, respone, error) in
            if let error = error {
                print(error)
            } else {
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode([appDetail1].self, from: data!)
                    print(model)
                }
                catch let err {
                    print(err.localizedDescription)
                }
            }
            
            }.resume()
    }

}

extension DownloadManager:URLSessionDelegate, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("\(bytesWritten) and \(totalBytesWritten) and \(totalBytesExpectedToWrite)")
        
        if totalBytesExpectedToWrite > 0 {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            delegate?.updateProgressBar(progress:progress)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Completed")
        delegate?.updateUI()
        delegate?.updateProgressBar(progress: 1.0)
        try? FileManager.default.removeItem(at: location)
    }
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        /*DispatchQueue.main.async {
            guard
                let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                let completionHandler = appDelegate.bgSessionCompletionHandler
                else {
                    return
            }
            appDelegate.bgSessionCompletionHandler = nil
            completionHandler()
        }*/
    }
}
